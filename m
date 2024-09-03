Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADEB1A302B
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Sep 2024 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725350893; cv=none; b=YfnIY9OpYU50ajucwB0GMpoIgJUplpmWnlJuBj7AxJIDpEOEXSUnUM7gabCRolH6RoQYf2BKyCGGcehcdRiJnN6jvycfkuIPXKEsvKrViL5dhbsbLJqrwbmoguyCYz/e+PAidOorGmWVjKWp2yLN4qmnXmZWz2mjSMieUTajP0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725350893; c=relaxed/simple;
	bh=EJQ4HorIieLDPMk6rDfCSch6KPnFw0QNj71EaIN1MVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZBWZEleemfIjGv8Z7gp+fl85v9kBxj1uLwVFMw2hQ8L3Mfm4JxPxgm+Z6DKxs6W2mU385gIZve2tVNMt+8hvRqLktJ/1X0Eu278NHfMna3MEXli3KG8eJZ4u7LksUTLyl9cts6PhFaUJIGIo0fVZZPGU66nEKUUnL/UfnHzx778=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03D8AFEC;
	Tue,  3 Sep 2024 01:08:36 -0700 (PDT)
Received: from [192.168.178.92] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D943F73F;
	Tue,  3 Sep 2024 01:08:07 -0700 (PDT)
Message-ID: <5bbdd041-02a3-41de-832b-7f68cadca073@arm.com>
Date: Tue, 3 Sep 2024 09:08:05 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a64: Add WiFi/BT on Pine64
To: Icenowy Zheng <uwu@icenowy.me>, Peter Robinson <pbrobinson@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20240901122135.1389702-1-pbrobinson@gmail.com>
 <20240901122135.1389702-3-pbrobinson@gmail.com>
 <34afe6c1857190a23521815d85660f6125f0d302.camel@icenowy.me>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <34afe6c1857190a23521815d85660f6125f0d302.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/09/2024 06:50, Icenowy Zheng wrote:
> 在 2024-09-01星期日的 13:21 +0100，Peter Robinson写道：
>> Enable the rtl8723bs WiFi/BT modules on the Pine64.
> 
> I think the maintainer previously prefer to enable these modules with
> DT overlays.

Yes, we cannot have this enabled unconditionally, especially since this 
is explicitly given as the reason for the first two patches.
So either this would just stay on the list, for reference, (maybe marked 
as DON'T MERGE), or, better: we indeed rewrite this as an overlay.

I will give the series a test once I am back with my beloved boards.

Cheers,
Andre

> 
>>
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> ---
>>   .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17
>> ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> index f04f0f1badc4..1d514859e664 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> @@ -138,6 +138,14 @@ &mmc1 {
>>          mmc-pwrseq = <&wifi_pwrseq>;
>>          bus-width = <4>;
>>          non-removable;
>> +       status = "okay";
>> +
>> +       rtl8723bs: wifi@1 {
>> +               reg = <1>;
>> +               interrupt-parent = <&r_pio>;
>> +               interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
>> +               interrupt-names = "host-wake";
>> +       };
>>   };
>>   
>>   &ohci0 {
>> @@ -303,7 +311,14 @@ &uart1 {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
>>          uart-has-rtscts;
>> -       status = "disabled";
>> +       status = "okay";
>> +
>> +       bluetooth {
>> +               compatible = "realtek,rtl8723bs-bt";
>> +               device-wake-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /*
>> PL6 */
>> +               enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4
>> */
>> +               host-wake-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /*
>> PL5 */
>> +       };
>>   };
>>   
>>   /* On Pi-2 connector */
> 

Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377BB32D0DE
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jan 2026 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413242; cv=none; b=p9nnvamBfZ3QVF4tGR3MQgVJZMqkLCQIdGaSPHZwX4gZL4UCxQ2jj/m6P86EY+OM6ZmPIw2DiAZCcCd7szsk+XcVEkf/SL8bjgQ/PP7h7gYhk6JvKd0UEZe4/mQcqL23XNV/BVuQA86L9GuKtsfKZ6rQjWWBaXWY3hUUNaUcJ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413242; c=relaxed/simple;
	bh=QYH47T3+q1nxGSrtGTBSP5UWkWbV4qDT/rcPu4Xa+Rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5/jUcjvFMlDSIsds3dhfq0764YzVUPV3pL8PiUunXp2w5uQKm/bwiWMCW6zjCkiWekT6f/qfQkyp5wPBh56sIfSYeJi48lXfL6w4+RzWs8CnMltm5NQZE9/e7bnj7b4LYYGQlRjRSnVhHibPRqhZrgPYFlLmc0hM2eA71B/54M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=benettiengineering.com; spf=pass smtp.mailfrom=benettiengineering.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=eTsFIiwn; arc=none smtp.client-ip=62.149.155.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benettiengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="eTsFIiwn"
Received: from [192.168.50.220] ([84.33.84.190])
	by Aruba SMTP with ESMTPSA
	id g51EvJo0PclBZg51Ev2sWZ; Wed, 14 Jan 2026 18:50:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1768413056; bh=QYH47T3+q1nxGSrtGTBSP5UWkWbV4qDT/rcPu4Xa+Rc=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=eTsFIiwn4gewslrI50V0fn4RWbprop4YjERP65Cb/Jhuru42kavUuBXbfQLd8nW8x
	 znM+EVKD6EMMEO5xct4QxYW30o3H8F9U45I7ddFi0d+3WYnFxGQlbk7tCBMmH3EPHw
	 84dapkXfFDQv4QKqLcxCUs9ClA8FXUpl6KInyGPawLo0+d/L9N8jvtLxAAor0OaFGw
	 XSwzMHiVtSwPnnyXutOSJnxU7k2fXtsG2x2H3jRucfAphQu6lRrBTGLkmAsJ81xxfm
	 jt1cI3WYoGTSta3wmLf7BguaXP3Ks1GuzyHkT9A7ySqoDPhUWmEJRHEX3/cc1CewDT
	 O+OVQu0EvZ6hw==
Message-ID: <9fca977f-4179-44de-b0dd-8e68d57addd4@benettiengineering.com>
Date: Wed, 14 Jan 2026 18:50:56 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
 <CAGb2v66gpmreQiDMDJ8NE1QJ-e+iBUVicw9sv=RgiwuONfUFAA@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAGb2v66gpmreQiDMDJ8NE1QJ-e+iBUVicw9sv=RgiwuONfUFAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI4O5EWksWdoOgtzKoloOwVUZ8Bj6+ptlGREGTz6tAhvPr/Ogj++Q0AR9lt5iCBb1rmZSuXEipnK/dxCtqPH2FkzJWOmpOYqH3E42/49WB6fsiay4zSz
 Vz8sg3phLDYnVUWeib75lZr5qrZNbPuNjsIcKRwd3ZcigeMMV+mD9ykFJ4dUQeKA17Vc1lDJWCGFsPu07hl3phHSQv9qN0VN4S2C/fgl11+9OUW8epQeNNhz
 GXeWpDA8pEeeiYHvVmVVAL2TGTJZU8MpPV+rrhlKuekTUodUgkuuCLexry1kPI7u94pr3nQSZadeSpjFkFehySUK/p5HNQp72kc2wWAKjsWtzKnLsBs2CCqC
 Gh4zGWHtEXojm6435e6b/oTDY5EXsFANYUM9OfabvXUQs37ZRsktuwUAYyp1B7puLcEqkA7koXEG3efBO+MuvhcG89SFD8K8+POeWArZpdZv1vLgAj1e7kd6
 dCW+rASKABkd+d8c5H6puH7FzMJ+Bw2eWVqsHlcFDVuJwYZdt+ZG37UebV6hKeEizqAYtT8QIVnhldPR

On 1/14/26 15:07, Chen-Yu Tsai wrote:
> On Wed, Jan 14, 2026 at 6:50 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>> Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
>> enumeration during boot. When both an SDIO WiFi module (MMC1) and
>> an SD card (MMC0) are present, the kernel may swap their indices.
>>
>> Explicitly define mmc* aliases to ensure consistent device naming
>> and prevent mapping conflicts.
> 
> Years ago we (sunxi maintainers) decided against this.
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++
> 
> And aliases are per board, so this definitely doesn't belong here.

I see, thank you for taking care.

Best regards
Giulio

> 
> ChenYu
> 
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> index 5f44f09c5545..a958400bcd7c 100644
>> --- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> @@ -55,6 +55,10 @@ / {
>>          #size-cells = <1>;
>>
>>          aliases {
>> +               mmc0 = &mmc0;
>> +               mmc1 = &mmc1;
>> +               mmc2 = &mmc2;
>> +               mmc3 = &mmc3;
>>                  ethernet0 = &gmac;
>>          };
>>
>> --
>> 2.47.3
>>
>>


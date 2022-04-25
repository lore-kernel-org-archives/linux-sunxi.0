Received: from mail.cosmopool.net (h1.radempa.de [176.9.142.194])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470E17E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 11:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.cosmopool.net (Postfix) with ESMTP id 3A2B790168A;
	Mon, 25 Apr 2022 13:01:56 +0200 (CEST)
Received: from mail.cosmopool.net ([127.0.0.1])
	by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 672odDHYvjf8; Mon, 25 Apr 2022 13:01:55 +0200 (CEST)
Received: from webmail.cosmopool.net (localhost [127.0.0.1])
	by mail.cosmopool.net (Postfix) with ESMTPSA id 4634F9004FE;
	Mon, 25 Apr 2022 13:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ccbib.org; s=201902;
	t=1650884515; bh=xZhRc9yY05nLmAbLSXvLWBHxam/xcmOns6t5R8P3spg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a7lU1MxVpyhPBWR4LzcrQbrs6SaYQnyoMOKgAxYp9SkAdpxeI+V46M7f4R9dP4EgX
	 F3i/xtNN6xl08FJSz4UG3vMONy5IZu7s4MqZRXlT3auy+tP8CS4dIPUNp/hIwax0oJ
	 D5EsVejqvCzQYqbBF1TpS0KyTsJ/7vuWfJQYGRbY=
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 25 Apr 2022 12:01:54 +0100
From: Harald Geyer <harald@ccbib.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 <linux-sunxi@lists.linux.dev>, <devicetree@vger.kernel.org>, Torsten Duwe
 <duwe@suse.de>
Subject: Re: [PATCH] arm64: dts: allwinner: teres-i: Add GPIO port regulators
In-Reply-To: <336f8b96-6eee-16a5-e896-e90c4020f740@sholland.org>
References: <20220415165605.28560-1-harald@ccbib.org>
 <336f8b96-6eee-16a5-e896-e90c4020f740@sholland.org>
Message-ID: <462969fd722eec45aa5f142de48b7fbd@ccbib.org>
X-Sender: harald@ccbib.org
User-Agent: RoundCube Webmail/0.7.2

On 24.04.2022 03:56, Samuel Holland wrote:
> On 4/15/22 11:56 AM, Harald Geyer wrote:
>> Allwinner A64 SoC has separate supplies for PC, PD, PE, PG and PL.
>>
>> Usually supplies are linked via the 'regulator-name' property of
>> regulator nodes. However when regulators are shared we need to
>> declare the additional links in the pinctrl node.
>>
>> Signed-off-by: Harald Geyer <harald@ccbib.org>
>
> I'm curious if this solved an issue for you, or if this is just for 
> accuracy.
> Both of these regulators have the regulator-always-on property, so
> they should have been enabled already.

You are right, there shouldn't be any change in functionality. It is 
mostly
for extra correctness. However the pincontrol driver started spewing 
lot's
of warnings about missing regulator nodes a few versions back. The 
visible
effect of this change is to silence those warnings. Also make the DTS 
more
future proof in case the driver is made even more picky in the future.

> If it's the latter reason, why not add the other
> ports? Regardless:

PD, PE and PL have dedicated regulators, that can be matched via the
'regulator-name' property. I didn't want to specify the same 
information
in two places.

For the PF supply, I couldn't find any connection information in the
board schematic. I could have added a dummy regulator. But since there 
is
only one warning about pf-supply during driver initialization and not 
the
dozens of warnings I see about PC and PG, I figured, I'd rather not add
information of dubious use or qualiy.

best regards,
Harald


> Reviewed-by: Samuel Holland <samuel@sholland.org>
>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts 
>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
>> index aff0660b899c..cc316ef2e2d6 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
>> @@ -197,6 +197,11 @@ &ohci1 {
>>  	status = "okay";
>>  };
>>
>> +&pio {
>> +	vcc-pc-supply = <&reg_dcdc1>;
>> +	vcc-pg-supply = <&reg_aldo2>;
>> +};
>> +
>>  &pwm {
>>  	status = "okay";
>>  };
>>


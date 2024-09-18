Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502215D5A1
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Sep 2024 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653778; cv=none; b=UZdqNG7bElLxNskX43zn3pQdBGuaEz+5JnC5yV+wpuWjffZAGrAoKJZ49gDU4VbqXeY7COhYtgnd8GSV3A8OLehCBpTLsYMVlKBvi2w9e1Kg2ZeIhL/ngjV6XZ+yCNkZx+D+c6esaO3MYgq1jnFrHS85ehodIhcW13bf6XGkBmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653778; c=relaxed/simple;
	bh=dKZ9Lq1IyOTqi1zrlsjL1cDpRz8wcei72OpY1hhOytc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=H/C27bX2MsaKm5YsDembAC8yyAGkHJfySjJc1Ss6deru9xIYFIhPPe1pTOC6GdtYJkvsMFtzyPWBGtn30Y6tlZRJ9ma2dJdLrQBpwBZvDQCKyd6vd7FgDZcyQxAXpZWATvEbUIhTtzlJfwQwRlqwPAZ4+4ajUV+XZOHTNF1PLpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=mPKghpKe; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="mPKghpKe"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1726653773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/8lONfZx+FNIG6iiP8W/GCBkEVHBI2sFN2P8FB9u3g=;
	b=mPKghpKewlIiFRrA2nq/WkbEY+k5/KEcn4TeT/fVE8FMl9WBQq9buha7xO/uXkI7a7X7KK
	EG2ATNC31Ehm5S7iV3RR/gO0ia3+c1h2K9KJ5v0vdYyVKshBNwEmDdvHB3Dh6wlB1Y7Ccn
	umCo3Q78jicZVMF/reFLq4hDqb1ukGFLJILrUJ0HvBeXm1yotIfG0hpKC3FupkJFV6rF48
	w9YHBvnvsGjDnGS9Xj6mmVT3zAHYYkFi0JAlYQKb+7vXZdiHFz8J7JjrxxGU1nHgw4Y0Sp
	1QWhedTyCsNBj9UPbxCbQtn+tSPSC4DdtbXnykLNcotFpDbJa1iU2RJVTKqtag==
Date: Wed, 18 Sep 2024 12:02:53 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Subject: Re: [PATCH] arm64: dts: sun50i-a64-pinephone: Add mount matrix for
 accelerometer
In-Reply-To: <c7664fda936d36e0d916ae09dd554d2e@manjaro.org>
References: <20240916204521.2033218-1-andrej.skvortzov@gmail.com>
 <6e5d0e9978bff30559c17f30d1495b59@manjaro.org> <ZunCysUTSfQU1ylg@skv.local>
 <c7664fda936d36e0d916ae09dd554d2e@manjaro.org>
Message-ID: <64a2bf8f1491e510e93cc4c121975fd9@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-09-18 11:27, Dragan Simic wrote:
> Hello Andrey,
> 
> On 2024-09-17 19:56, Andrey Skvortsov wrote:
>> On 24-09-16 23:08, Dragan Simic wrote:
>>> On 2024-09-16 22:45, Andrey Skvortsov wrote:
>>> > From: Ondřej Jirman <megi@xff.cz>
>>> >
>>> > accelerometer is mounted the way x and z-axis are invereted, x and y
>>> > axis have to be spawed to match device orientation.
>>> > The mount matrix is based on PCB drawing and was tested on the device.
>>> 
>>> This commit summary should be copyedited for grammar and style.  If
>>> you want, I can provide a copyedited version?
>> 
>> It would be helpful to avoid further grammar/style problems in the
>> commit message. Thanks in advance.
> 
> Alright, here's how it could be worded...  First, the patch summary
> should use the common prefix, together with a bit of rewording, so
> the patch summary should read like this:
> 
>   arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
> 
> The patch description should be reworded like this, reflown into
> proper line lengths, of course:
> 
>   The way InvenSense MPU-6050 accelerometer is mounted on the
>   user-facing side of the Pine64 PinePhone mainboard requires
>   the accelerometer's x- and y-axis to be swapped, and the
>   direction of the accelerometer's y-axis to be inverted.
> 
>   Rectify this by adding a mount-matrix to the accelerometer
>   definition in the PinePhone dtsi file.
> 
>   [andrey: Picked the patch description provided by dsimic]
>   Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for
> Pine64 PinePhone")
>   Cc: stable@vger.kernel.org
> 
> Please note the Fixes tag, which will submit this bugfix patch
> for inclusion into the long-term/stable kernels.
> 
> Also note that the patch description corrects the way inversion
> of the axis direction is described, which should also be corrected
> in the patch itself, as described further below.
> 
> After going through the InvenSense MPU-6050 datasheet, [1] the
> MPU-6050 evaluation board user guide, the PinePhone schematic,
> the PinePhone mainboard component placement, [2] and the kernel
> bindings documentation for mount-matrix, [3] I can conslude that
> only the direction of the accelerometer's y-axis is inverted,
> while the direction of the z-axis remain unchanged, according
> to the right-hand rule.
> 
>>> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
>>> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
>>> > ---
>>> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
>>> >  1 file changed, 3 insertions(+)
>>> >
>>> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
>>> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
>>> > index bc6af17e9267a..1da7506c38cd0 100644
>>> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
>>> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
>>> > @@ -229,6 +229,9 @@ accelerometer@68 {
>>> >  		interrupts = <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
>>> >  		vdd-supply = <&reg_dldo1>;
>>> >  		vddio-supply = <&reg_dldo1>;
>>> > +		mount-matrix = "0", "1", "0",
>>> > +				"-1", "0", "0",
>>> > +				"0", "0", "-1";
>>> >  	};
>>> >  };
> 
> With the above-described analysis in mind, the mount-matrix
> should be defined like this instead:
> 
> 		mount-matrix = "0", "1", "0",
> 			       "-1", "0", "0",
> 			       "0", "0", "1";
> 
> Please also note the line indentation that was changed a bit.

Actually, unless my analysis is proven wrong, perhaps it would
be better if I'd submit this patch in its final form, because it
has diverged a lot from the original patch.  IIUC, Ondrej only
imported the original patch from somewhere, without some kind of
proper attribution. [4]

> [1] https://rimgo.reallyaweso.me/vrBXQPq.png
> [2] https://rimgo.reallyaweso.me/uTmT1pr.png
> [3] 
> https://www.kernel.org/doc/Documentation/devicetree/bindings/iio/mount-matrix.txt

[4] 
https://xff.cz/kernels/6.9/patches/0221-arm64-dts-sun50i-a64-pinephone-Add-mount-matrix-for-.patch

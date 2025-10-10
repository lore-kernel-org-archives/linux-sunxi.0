Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A01C230BCC
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Oct 2025 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091545; cv=none; b=sguoUrEgLDL0OMIephT6b0eUfkkLnF4fmdZi4o8IlmBO3qgqsTMmoUbHnQnlmO4paDn9a7x6WHQiPU28Vw2+8cCjrgOLxg28002ZRV20RO4w8oYs/col+mtw9NCKeJqlDtlLarBGTK5gO9fnHvMGBAzY+1yq6M3rk2PCSDSHY24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091545; c=relaxed/simple;
	bh=ycIJteNJlFa4E91nmjTsG7Ydwp/kd8agQIVSEu1Zi7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHzaPjkuKc4padxzfxiZqXDhjiwbu291bAjI1jFP5tIUBjDRbtXh/6PbIkqJo+nnP5PTn/Olm1cluFdh4zb0GNgHq3+9Go812QEvmBHvTDuMSd0u4Pma0lhxK1Uv3cWd7/H1vzsg86JB/Z3zB/qXttwPnUEIfcNYnmH/oLuQT6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s2SQuA9T; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s2SQuA9T"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A97431A127A;
	Fri, 10 Oct 2025 10:19:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F0A460667;
	Fri, 10 Oct 2025 10:19:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A517D102F220F;
	Fri, 10 Oct 2025 12:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760091541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6nMxZyzrduqra3rZXm40NnFrsNOonRPZCrd4Yv86yAk=;
	b=s2SQuA9T0Zh50gLxJQEHVyB7KWdmyxNtuvUNc6eZipNm+ayFViPOyhuYlf3eNhGcqm41ZV
	BBH1gbazPsn41Bb8Y5KbnCIuwt7cEm2Ul8RSrJngxr+sSZHLekGU/0UBgEyDNiHuKWvpI9
	vFVJWps2kudIyHLCMDb3ov13c8pLWJmArGcKk193kO8io6v6JnOB60waxbT9M4Nv4i80Cj
	GHenGF/eCzfKdbKNzPOnuzHjd2ssfKrGkklY3ceBlz9vIXRf9dDiWqwXVRXx6Zs0gGvs2m
	+cTvGadpeS46ysgBy41KBsHM5uNJ67TguV3VKYp/xnsoSAZtk2/LH3gLoEphKA==
Message-ID: <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
Date: Fri, 10 Oct 2025 12:18:56 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-3-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 10/10/2025 à 10:49, Krzysztof Kozlowski a écrit :
> On 10/10/2025 10:40, Richard Genoud wrote:
>> +
>>   properties:
>>     compatible:
>>       enum:
>>         - allwinner,sun4i-a10-nand
>>         - allwinner,sun8i-a23-nand-controller
>> +      - allwinner,sun50i-h616-nand-controller
> 
> 
> Also:
> 1. missing new line - why did you remove it?
> 2. Keep existing sunxi preferred order of entries. In other platforms it
> is alphanumerical, not natural. In case sunxi uses something else, just
> be sure you use sunxi order.
ok, make sens

Thanks!

> 
> Best regards,
> Krzysztof


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

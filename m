Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C629A9C8
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Oct 2025 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296950; cv=none; b=tN2tehPno3kdUQArVByy0fFd1CvQRDUq51FgVVGrLGNT9BJ3evlbiLG444AaN7aMNRoyl48c/rynSlAbvRgsWqeuOCANq/PgKsWI3TUCkt+SRxADcv0MxWkzP9KCaN3Zdb3yRafKhY6WzzccCwm54aFAhC1AjbKLPmhdo7czMtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296950; c=relaxed/simple;
	bh=TtNqNtj/oweL66wLEnAjqn0K8TKkNs3/8zy5s/IZrRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcgD1dPNWwkKKz3RXcHm4le/LcsGLXycv3uzRyxmPZoWwf7u+2hDDFzoONBUomrSLs35+H6SYponDPT6xVcgyNFeN+ajL/w+P/5nnyaO8L77dRof3ncG6YH5ie8+Zq1G5nd/cuCixxwW1q5P5wsLMdrKakbM/Tit/bIkr4MxiOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ggefOGsg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ggefOGsg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D951AC0C41D;
	Fri, 24 Oct 2025 09:08:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96E7B60703;
	Fri, 24 Oct 2025 09:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 876B8102F2465;
	Fri, 24 Oct 2025 11:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761296945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tAbjKjhcDfGtn2/zGatVn9Yy3ReIVrMyjwO7fZd2L1s=;
	b=ggefOGsgpiVYyF0A3GE6TACY+UYwP2pgRZuAOmS8vR4gYC0oJOS70Lt46N5pEU86oQOzsw
	zxshp2tqPIobCsAoLCPJfm7PDjpY19gXfPrtq0zS33GwSX/LM/6uoAKMTH0tYrZfkFVyZQ
	nY2RQw3SxggVF9teOpRRtGVLP5evJ4UkjhqR6E/1E1sqVYw5A2xojF1Tu7ZW5kLXQsuVzF
	exs2+bOMNrk3HAEwDEazo40qEFbyaXQicieeCuWJzzO4NeN0VeCiSGJCWgF0iU+aAnu93K
	YJsetl3/TxCCaUdeycGVB/cCbWMzCowcUwhc574+swKaMU/mav9s09Qk0Pvd1A==
Message-ID: <a231f2a4-1cc4-4e40-8560-f0cb72b21f1a@bootlin.com>
Date: Fri, 24 Oct 2025 11:08:45 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-15-richard.genoud@bootlin.com>
 <878qh3thqo.fsf@bootlin.com>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <878qh3thqo.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 22/10/2025 à 11:20, Miquel Raynal a écrit :
> Hi Richard,
> 
> On 20/10/2025 at 12:13:10 +02, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> The H616 NAND controller is quite different from the A10 and A23 ones,
>> some registers offset changed, and some new one are introduced.
>> Also, the DMA handling is different (it uses chained descriptors)
>>
>> So, introduce a new compatible to represent this version of the IP.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   .../mtd/allwinner,sun4i-a10-nand.yaml         | 41 +++++++++++++++++--
>>   1 file changed, 38 insertions(+), 3 deletions(-)
> 
> Please move the binding patch first in your series (binding then driver
> changes aligned with the introduced binding and then DT changes using
> it).
Yes, sorry, it took time but now I got it :)

> 
> Thanks,
> Miquèl
> 

Thanks!

-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F4942AA3
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Oct 2025 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760356613; cv=none; b=J+uqS64xvA5rweFuxSH5WuAtA30/84uTi3LBV+DH/I2sHDUq8rlexACXcsl6r63viAyvt3dVcMYip57+n0CEcRdmABOGuUSUFeGuKtWoxO/5/cLOzsE3m/1oRkbIsUKC+I4QqC8YtrkoCIpOWJPtAqK7I9GoDle5HPgMNDIMOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760356613; c=relaxed/simple;
	bh=TTxjQ5UmV1gm/V1SVo0FHtEUWPWjbpxIaGVn41OcS/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Plz4CYRS4R8/imO5lBjLiDEsyWwx4ytb2Exm7LUr5hh0brZFav7u6/Bskr8v+BXX0oNlP575O4yiOk7uji0m6Tf1U+xjOYzlBUftmDcVH6XUh4KI7KYHz5qM8L7n0UJPjFBnSWYwuNdYFazihv473thu7FwyLpE+pdRdRD9VS04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FGIlVqU1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FGIlVqU1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A4D114E4106C;
	Mon, 13 Oct 2025 11:56:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 640BC606C6;
	Mon, 13 Oct 2025 11:56:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1241A102F225F;
	Mon, 13 Oct 2025 13:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760356607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kSqZsCaeyifb+phyADiRq9RCwi01zTsrsstZYJCLh5I=;
	b=FGIlVqU1ARC0txcIqhMgTCjEbnmOVsxYuNtwj3DQgf8sZXgaaZOsT+IH5cYN8NFKOjFq0W
	8tFHXq6dBMsgZuEjA5cKfs8KAtznSjE6zYK2fVYypXpbZY72lOeTXsU9MyXsH4J11LceJs
	qryByDgxrbQ5xXcCBMtpxA5iy3zlB8ubkI5SRUh+Zy8FeDMcpoWK7cDOH81KUy+TC/28vI
	ujo/wDRKpM6yH2Bnljp9vqrHB8lLAEVQpN0G4FLS2WBFnzl3s0qbZyrokDatVIEAKWRJeC
	r7mB0cIXaQF03TFJh+8YEw4lxrZVMZQ82D7MgU9nAr3WF6ML27205iTmBE7pkQ==
Message-ID: <1753a54d-907c-4861-b83b-89a6b77b589e@bootlin.com>
Date: Mon, 13 Oct 2025 13:56:32 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
 <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
 <12756400.O9o76ZdvQC@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <12756400.O9o76ZdvQC@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 11/10/2025 à 12:27, Jernej Škrabec a écrit :
> Hi,
> 
> Dne petek, 10. oktober 2025 ob 12:18:56 Srednjeevropski poletni čas je Richard GENOUD napisal(a):
>> Le 10/10/2025 à 10:49, Krzysztof Kozlowski a écrit :
>>> On 10/10/2025 10:40, Richard Genoud wrote:
>>>> +
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>>          - allwinner,sun4i-a10-nand
>>>>          - allwinner,sun8i-a23-nand-controller
>>>> +      - allwinner,sun50i-h616-nand-controller
>>>
>>>
>>> Also:
>>> 1. missing new line - why did you remove it?
>>> 2. Keep existing sunxi preferred order of entries. In other platforms it
>>> is alphanumerical, not natural. In case sunxi uses something else, just
>>> be sure you use sunxi order.
> 
> Sunxi order is from oldest generation to newest and then alphabetically
> by soc name.
> 
> This is already correctly ordered.
Ok.

Thanks!

> 
> Best regards,
> Jernej
> 
>> ok, make sens
>>
>> Thanks!
>>
>>>
>>> Best regards,
>>> Krzysztof
>>

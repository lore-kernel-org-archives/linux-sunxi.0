Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CA40DFAB
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Mar 2026 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773312461; cv=none; b=iJn+JAYiwaGx7GZnPC/wi2zUWRScDOCs7cT8ERtQTnuC65HqQg51jgTZPXLuEDpmbPwT6qgAsS/kvl8Ply4KLKWkea7rSrsZg5yXUtfa35/XxzVPneky5txif0CzXwhoPAfEh+l71/SjOjXvhPzuEzbBdZKGj8pDfnBqJyJ/J6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773312461; c=relaxed/simple;
	bh=K3deujP3NYWTeoHQVorjZ19icEn5XcPuOJEdr5pwQf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyT2lDnJ0aVpljQ5AWNlf4spqgqK8+NP+hq3dQuds+PisKh3hDRoZpAott1UvZ6PW8N5Dk8WNrFuuoo0NZgO3lR0B8ManuHU3OhLQPALaxKLrfy7HcJp/vvjc1hul+38jgfmC39VTlbbP4r0zTLNmCbgkSqdtYME5z70czqVj8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JaEHHHnq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JaEHHHnq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B1304E4264F;
	Thu, 12 Mar 2026 10:47:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FF315FDEB;
	Thu, 12 Mar 2026 10:47:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11EC610369C88;
	Thu, 12 Mar 2026 11:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773312457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=h1uHovn6Yup6c3SyQUieodwk4UlRm93zEwCbjt4JOGM=;
	b=JaEHHHnqNbNmuD8Ch3LK6QaSJ74j0vNJCsrjA+LWq/5L84WfkVe1vDxAxQd+IxrJfZCa1a
	hT3qgXKMi0iGpoktI5bUvrNGNbafIDHPdCkcQys8BES2om5Es4IjiDSF/O0NYiWFZrs30b
	DK4n3LOBf79X8IKhHUEh9IB9rQMgmLhLlhR4iOAT0CWpesvwWDc4XGF7RkeJGsv6bna/9H
	h9sYoyn5cTcxoftMpAGK8iDeO31EkiuaiefYWnVbyAWxFLVIigg42FUZ8oO0FunKdNZIAR
	Ty/zLOLgE1raczyrfSphyi7ytsCEAGr/zaIPQg9Wg+rbyi3Ut/2oFnlepKEmww==
Message-ID: <a157ebaf-c8bc-4123-a7fa-e38beac8f268@bootlin.com>
Date: Thu, 12 Mar 2026 11:47:33 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mtd: rawnand: sunxi: make the code mode
 self-explanatory
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-6-richard.genoud@bootlin.com>
 <874impne0n.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <874impne0n.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 09/03/2026 à 17:50, Miquel Raynal a écrit :
> On 05/03/2026 at 11:01:36 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
> In the title: s/mode/more/?
> 
>> In sunxi_nfc_hw_ecc_{read,write}_chunk(), the ECC step was force to 0,
> 
> forced!

Will fix that.

Thanks!

> 
>> the reason is not trivial to get when reading the code.
>>
>> The explanation is that, from the NAND flash controller perspective, we
>> are indeed at step 0 for user data length and ECC errors.
>>
>> Just add a const value with an explanation to clarify things.
>>
> 
> 


Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CB83A4503
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Mar 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773326510; cv=none; b=te9TuQdxL5AItyE9OVS2mO6eoiVqRFi5G0O5CYA0OGt/jKu2ssT3gUE8m/fVpgcJ/GEeHZ0craC3U7sf4u6UQIsJlpMKWRwp4jUTEb5Jj0451yAlgrU9AXVPdFJYtbEAxn4JgzUEZggW2TsauiacYss3P6LJmsiZcG8HRJWELns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773326510; c=relaxed/simple;
	bh=ltlhWB/R+dYGhwgGAypvr2FmzCOvy+OJ80K5UktbZIE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HtwWm7d3P15UkPAMOclTZ9eC3OBihAg2Rtsx1w4pV1XrZ6YAWfDheNTDxwrN4xeTTUNLrhoYSELBTHuJYt0MQLoY4y7kbpV92i4hsnO+boCnJcAzrANFjuxcVwCV6d4LcnoO/4CYcm/wM7jZ6ZeiluEOXngZbw04kbM+06wBuis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kV0XiLLp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kV0XiLLp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 94CCA1A2E04;
	Thu, 12 Mar 2026 14:41:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D5475FDEB;
	Thu, 12 Mar 2026 14:41:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F0A210369D80;
	Thu, 12 Mar 2026 15:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773326503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ltlhWB/R+dYGhwgGAypvr2FmzCOvy+OJ80K5UktbZIE=;
	b=kV0XiLLpl4YNjd6gU8pjNriysy8QLHtVqlgAPiNuSIDpxocFAZ98E0y6tD6BaKry4u3SFN
	KAEvXGtWCbFfJtsbTk7yJq3ZoVQ9N7aclod3WLXq6l/Y+jorST7y0mPhxgv2doAaI7dLY3
	2slj7/07RR5LtJZhp8A151pDaMflTE7+Qmp16V6a9/ckHcHP+gDvQjm7iJIjB3jT568ATs
	YwmvkArjHljO9a3iz7FyOpyoWz6YTyJUCcczcGtrMWWQvnbmzz2+pA09scVrJX9nMfuvUo
	8Ngy9QYTATB++eYBEmYgM1qsF1qEupUNEHf4LbsyjXVDXYQWXcKb//pz1dNoIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Wentao
 Liang <vulab@iscas.ac.cn>,  Maxime Ripard <mripard@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mtd: rawnand: sunxi: introduce variable user
 data length
In-Reply-To: <20260305100137.2558423-7-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Thu, 5 Mar 2026 11:01:37 +0100")
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
	<20260305100137.2558423-7-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Mar 2026 15:41:37 +0100
Message-ID: <87a4wdkt3y.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Richard,

On 05/03/2026 at 11:01:37 +01, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> In Allwinner SoCs, user data can be added in OOB before each ECC data.
> For older SoCs like A10, the user data size was the size of a register
> (4 bytes) and was mandatory before each ECC step.
> So, the A10 OOB Layout is:
> [4Bytes USER_DATA_STEP0] [ECC_STEP0 bytes]
> [4bytes USER_DATA_STEP1] [ECC_STEP1 bytes]
> ...
> NB: the BBM is stored at the beginning of the USER_DATA_STEP0.
>
> Now, for H6/H616 NAND flash controller, this user data can have a
> different size for each step.
> And the vendor has chosen a different layout from the one on A10, using
> 8 bytes for step 0 and nothing for further steps:
> [8bytes USER_DATA_STEP0] [ECC_STEP0 bytes] [ECC_STEP1 bytes]...
> (Still with BBM stored at the beginning of the USER_DATA_STEP0)

I would rather be in favour of not following $(random vendor) firmware
layout. Upstream, it makes probably more sense to just allow access to
the maximum number of bytes that can be covered by the ECC engine, so I
would rather be in favour of computing the maximum size that you can set
for each step, without going over the OOB size.

Once this set up, I believe adapting the driver locally (out of tree) to
match a specific vendor layout would be rather straightforward, as all
the configuration pieces would already be in place.

Thanks,
Miqu=C3=A8l

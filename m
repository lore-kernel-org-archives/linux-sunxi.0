Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329C3D522B
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Mar 2026 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075026; cv=none; b=pJaPhPuUjWplTPwQ73VFWY3X4/O0ZjngcFw/tEhn2f88j2t+6OPsrieDZcxj5KWzCMQrEHkSWI9O/FGwtqm7LWXqYAGXq4BXlztOF20XOdlXdHkA6kxwypixjLlennl6b5P7/XzI8QydPTSZkMu+ykixc0g7aY7hPa2LINJpHTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075026; c=relaxed/simple;
	bh=uCa5E0cT/HxGsfvjRkAG8+WAJStVe5z2flz2Ygtj3Lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ma1dgoKqOmPflfODEPqsPxcKRX6mrpuEmGHNFd4I6ustt2YRq8O8udkLISqKUs6/AEekXcA8WgLbhvlmpcFExJdZX+IjzPPoS4YGvFRJKlflfRtjiatGY0MrmK8J6/D5F/vopYSriBdA60+/qYLN25it0lTFT6gqrLWbguTfd7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xuzi6Gbz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xuzi6Gbz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 91B46C4287B;
	Mon,  9 Mar 2026 16:50:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 154C15FFB8;
	Mon,  9 Mar 2026 16:50:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86BDE10369C0E;
	Mon,  9 Mar 2026 17:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773075021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=uCa5E0cT/HxGsfvjRkAG8+WAJStVe5z2flz2Ygtj3Lo=;
	b=Xuzi6GbzaDiNcpso4+1/KP7UHSFNrQ81rvx3+kESkybunmDg+cFAM4wgTctbKObWH198RX
	TFoav7BOLChBSgCPOQg+IX3SWMOCELeqaHXkilooUXCU7bWaTXvVZp1/ht0PQjDV+YMBV3
	T6FFVZ3etgHD9qcR8Kp8gGJKk0fhkBFrhaw43MFkxX1K8isr8E2lKXnm89kZUc+CLGw+om
	h36glR8Z79u6Pc3CMw0T/rJYGFfokgsuuEx9eU/KB08++uKgCgnobrFLNjBoSF1k78ADmr
	53vdusBNgArh4+DOAxpAezoYygaSHQ5RmvQVdsXHno827P4WuJ+QRHI6065syw==
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
Subject: Re: [PATCH v2 5/6] mtd: rawnand: sunxi: make the code mode
 self-explanatory
In-Reply-To: <20260305100137.2558423-6-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Thu, 5 Mar 2026 11:01:36 +0100")
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
	<20260305100137.2558423-6-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 17:50:16 +0100
Message-ID: <874impne0n.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 05/03/2026 at 11:01:36 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:

In the title: s/mode/more/?

> In sunxi_nfc_hw_ecc_{read,write}_chunk(), the ECC step was force to 0,

forced!

> the reason is not trivial to get when reading the code.
>
> The explanation is that, from the NAND flash controller perspective, we
> are indeed at step 0 for user data length and ECC errors.
>
> Just add a const value with an explanation to clarify things.
>


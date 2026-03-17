Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80BF3E3C5D
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Mar 2026 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758094; cv=none; b=kKWvXnD1DnJKEO5mhk+B5rW+HlRvBfo6WI+Z6b8+tIX2le34+Jt9MSce8Gw/O+wj12MdvWPjdz5Tc2k3dC51/ZMr8XdUb8UshqmQXeIfYaPrd0GqyrTCr6gS44000F7wkM09CCF61Qz7TWLtOzZXqw0FqrOfuDTa+Hp4eEMDljM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758094; c=relaxed/simple;
	bh=AB27t9Hrh8v1l+efxd9rGwee8zT4bz2+Oer3gQQO2fI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jHuYQ/ghgfuIFuNvBD7o+yLoDu2WOYsdf81l/un4TKo/uuRtk7QZhS5mxO0/6Va/tJmCzf6+dVrH+CKP5veX+NG7X7i/Xeeei30NyrLgaP+JkBsYlyWVCan9F+9HriPzcdzumRj4FRo9mDJZ+JLNNwX7LkiCtglEG82FabRqLRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pPqPaEBe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pPqPaEBe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9FD52C55056;
	Tue, 17 Mar 2026 14:35:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78B695FC9A;
	Tue, 17 Mar 2026 14:34:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2619D10450600;
	Tue, 17 Mar 2026 15:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773758089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AB27t9Hrh8v1l+efxd9rGwee8zT4bz2+Oer3gQQO2fI=;
	b=pPqPaEBe+JR022mSMm8YzTax1CYVXEJJstYBH/9n/RK+TN6NH+7xauD2sKhAgheF/2pkbD
	JP8aT2j4IAweob1w7uFC00DeSGhow/E1mPqf/aT/OoLpf1EaeEnA0h4d42De7TK/CpPNxk
	wGzx9C48G9SY1lD9J1UJLbXEG2MyeD9z+bWIV2YMO9UYY01bQ/Z2hYE/LcUs1G+ogu2V6E
	bDR4J9JmH8HLgc3Ew6q+cfnnw5T/z0ewQVN/NhbB/5Yh0o5EVunpUJzIoA4SnRR2XZGvHH
	u1MbCVvlNibinl4IsVzS0q/TW8zK9zcwgrRfAUmSLEddAMuw0wFknUmja6bjkA==
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
Subject: Re: [PATCH v3 6/9] mtd: rawnand: sunxi: remove dead code
In-Reply-To: <20260317142437.580204-7-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Tue, 17 Mar 2026 15:24:34 +0100")
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
	<20260317142437.580204-7-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 15:34:45 +0100
Message-ID: <875x6ued8a.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 17/03/2026 at 15:24:34 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:

> sunxi_nand_ooblayout_free() is only used in a code path where
> engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST
>
> So the other cases can be removed.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---

Thanks! This looks much simpler and yet remains accurate.

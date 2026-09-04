Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154283A382F
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532939; cv=none; b=VMfynvO3e+tQGeewUak2tXErVv5STi4SRl5awVfUfmhqLtCL1s/NhtYoDP/IkF5DGW0+iktNpyn1oz2JgBQ1B4MqkaLI4VBHMaH3uqblu2nP2mlvX8Y6PEwL8G/3+U9GUA55udEYmoSWRiIpP761e8OZYbLIUYJJGOZShGQ47G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532939; c=relaxed/simple;
	bh=Q4Kqmm3PYSPz3CtKuYBs2ctj9qsb5M0Rg3AohwR0sUo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gTXytsq4x1KOLSK/B6yNryZTTTlnu/7y5+kh6+FpbCathKzGTbRnQjZ6odHBBejwzsqDxwx41/XZqvd38sT52+7nRjKZjDtZlSbl/hAhMzkM6/XtwXvn/EAnMfDD+HA3qWe21wZXvXpUQtZP1vNHjP62awoMUnsA8pmVWRRs+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TU6DGzit; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TU6DGzit"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DD134E414FE;
	Fri,  4 Sep 2026 14:42:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D39F6057F;
	Fri,  4 Sep 2026 14:42:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B48F11C7ADF4;
	Fri,  4 Sep 2026 16:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788532934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q4Kqmm3PYSPz3CtKuYBs2ctj9qsb5M0Rg3AohwR0sUo=;
	b=TU6DGzitYMj6dcYt7KxlJB+5/13t4QDtzUUyJZzTZrVda7JiTrx+TThy+oCxzh1l8k4ube
	qRcAS2JMtG4Ct9CvEGiGjXFl7mBP26Pyble1JOHgSvT1sWBUOIHwwcbmgDxUxDFnIRSEQM
	9QkWUN9JWtWVXisBvpRZVu5QpOBOPW2wb6L6hclQik+A+lst2csMJMH4OLR+wLTSHxc3ot
	khfqe4ftDs9mMqzn1QDfAyOBWObzWVoCCwrh59/HAOafZE8vqN+xOuUngJGJi8lf2yNFo4
	wNZ4V5voeVB2ZMN0ikD8FDDDwthMwNophBDst+deZu268hiVdqxkOvgYPcyBAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
	(James Hilliard's message of "Mon, 10 Aug 2026 17:04:50 -0600")
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
	<20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 16:42:09 +0200
Message-ID: <87se3p13jy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The controller randomizer covers the bad block marker along with the
> rest of the OOB data. The driver currently compensates the marker bytes
> before writes and after reads so that they remain plain on flash.
>
> Allwinner NAND firmware instead stores the marker through the
> randomizer. Media using that format appears to contain bad blocks unless
> the randomizer is enabled while reading the marker.
>
> Honor the allwinner,randomized-oob property by unconditionally enabling
> page scrambling and leaving the marker in the randomizer data stream.
> Keep the existing plain marker behavior when the property is absent.
> This changes marker handling on all supported controllers; the H6/H616
> protected user-data placement is handled separately.

But I think the reason why this has never been done is because it just
breaks raw accesses, including the BBT reads. I don't think this is
handled, is it?

Thanks,
Miqu=C3=A8l

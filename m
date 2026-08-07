Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603E439182E
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Aug 2026 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111020; cv=none; b=WI0SMThYy6LY/RqD9c/u0Z7SK3ufdxrcPTqkR5zfcbXsJagLHyhei7oSxyaJ0Bs75BfhBme8DwmfIBsdyBCBhCHhAfVEbgJ+qGFPRTQj9m1yYb1HU/N14F46ZnPqVVjQcvcybIw5eGyNMcdZSvTanYmIkPeMcqhQiZD5rRzKlm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111020; c=relaxed/simple;
	bh=U20/yY8yeUPz0vFOmPve6+pxju/thQDS8zZ9i8plDZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D/k+dlqLHU0uJGNH//gQrvUpu6lHhKZaJf3DG2PvAlsub+RH5wRqOPaedX28PqYsee44k0zp9jt6fua2CFCABv1oRqNL3i5xSwYLmOkik/bDOR/6pV4dSVIS1sdkxDuUE5PyGVlZbuFy0/EnD0Rn9bMGtoJUcMkk1qhulvfqO6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m4ld7mcJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m4ld7mcJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3D3DB1A14AF;
	Fri,  7 Aug 2026 13:56:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10E1C603F0;
	Fri,  7 Aug 2026 13:56:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8BB511C37957;
	Fri,  7 Aug 2026 15:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U20/yY8yeUPz0vFOmPve6+pxju/thQDS8zZ9i8plDZI=;
	b=m4ld7mcJ/8EvQhONDlGD3pR38SbYmnCTvxubioEBqPAUzm7bhBULx9dbfKH4lL2azlkpou
	oG8OxnurCtS0pdyRJYK2yw1yUU0Z6gFVe82+ZaKQkF5VfoKtNQ3jNRpNH7PTZcAWowhun1
	Qddkl9fFmIuhmAaYFEOtMBOPxAddmV65ZOtMZkuYKagr4vtnNf7qkpK5+K8Su9p76WpiMp
	/Cz8hdkWoTSpxBhfavWt1Y7+J6TLrdXfiPfDk6XTbwPhU6C5tg/1oe6saZzyPqBSMEY+l4
	xtPM2vU5RZ5cX81gsTD5BmeZFQRcaddA/BPhMX6WNulAZF75ktOkA8SgTlsPBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
In-Reply-To: <87tsp6avc2.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 07
	Aug 2026 15:55:41 +0200")
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
	<87tsp6avc2.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:56:47 +0200
Message-ID: <87o6feava8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


> This patch does not apply (linux-mtd repository, nand/next branch). You
> need to rebase and send a new iteration.

Nevermind, I got it applied twice and the error was of course due to the
second try, my bad, no need to resend.

Miqu=C3=A8l

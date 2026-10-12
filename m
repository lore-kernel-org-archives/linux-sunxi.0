Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6452F270
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913873; cv=none; b=OQd7l2ERaNBKuQilp2gd43iYn04WBRjJgmpoFTJrro6Pk6fIUl2aFhsz81pf4i8HYMnjJ7gqyI6d67OwOQtiIn1fEXiutkY5RXAfZ9afuOuBTHQcrf3fAz8sYS7q8P8JC6PulTHj+ca/HADxzGsUuUvb+zl8C3s19Gj8/u0sWRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913873; c=relaxed/simple;
	bh=iquteC2WLun4rL54eIEjgx3C2ts8WjjltRIkjPLgyLc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gd+o54ergtJY70EtL9pT9RNcHPDlXvBlXcZgD12hRny8zmeSXtcMFIvBTwmJ8SKJiPGWLL4L0PfpdA9DdF3m1NQ1laANJf1sTzskLdgJEft6JB6+pMBCJ6/CtfdChMT+VODEydN7pDEb+nJTzc36/syXhPmt3RfexrSP66B+f60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CA8kUzz7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CA8kUzz7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04BC14E41214
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 17:51:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC20860362
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 17:51:08 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 45A9611D7183A; Tue, 13 Oct 2026 19:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iquteC2WLun4rL54eIEjgx3C2ts8WjjltRIkjPLgyLc=;
	b=CA8kUzz70Yau2YqKPnZuTTGXQGw5yB8K960DedkPqoJS7iOd7dyP3zvv+VM0u9pyTcW0YR
	CgF1XFjq8O48v/mHTQqwwLFvu7we5nMVe6Rf7VTRDOrg9SNaLt96+1N3PgGJDtB/EeyBq6
	wXBj+GUensbPj3C1zQe0Haww8jH0it2wzP/YaNSfcIQYtQ/jswD+jcPhCA8h8jOcwJWU9U
	8vI3WUpgdNv+R5ZDn/8p8J+75xYgy4RawbgM+OGi7DIqxM5c0EhaEEU1tyiC+ZcSSr4Mpd
	Nb3PaUddEwKoCN+iZfTpDWQPtyCd9N4UDJZKXHO3HW0XqFrHKpQXtnde4BPGfg==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	(James Hilliard's message of "Mon, 14 Sep 2026 15:09:46 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 10:06:50 +0200
Message-ID: <871p9v4a1x.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hUm30DN6Lpz6
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 45A9611D7183A
X-Spamd-Result: default: False [0.58 / 30.00];
	BAYES_HAM(-1.82)[87.08%];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[33];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	BCC(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:mid];
	FREEMAIL_CC(0.00)[nod.at,ti.com,kernel.org,gmail.com,sholland.org,bootlin.com,socionext.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	TO_DN_SOME(0.00)[]

Hi James,

On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> Allwinner NAND firmware leaves the bad-block marker in the randomizer
> data stream. On H6/H616 it also places all protected user data before the
> first ECC step. These choices differ from the mainline format, which
> keeps the physical marker plain and maximizes the H6/H616 user-data area.

[...]

> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

I am sorry but I do not want to proceed further with this series.

Even though I am not capable of finger pointing what is wrong in the
diffs nor in the commit logs, I do not understand most of it. I cannot
clearly explain why, but I have had a hard time trying to understand
what the commits were doing. The risk is that nobody would then be able
to further maintain this driver and I am not willing to take that
option. The kernel policy so far has been to ensure readability and
maintainability, and my gut feeling is that this series is going
sideways wrt this major constraint.

Also, from a Linux kernel point of view, we generally just do not
support vendor specific layouts. I already told so Richard Genoud back
when he was working on H616.

With this added to the pile, I prefer not to merge the entire series. I
can still take some of the fixes if you feel like they would be relevant
anyway. In which case I invite you to send a v7 with just the few fixes
you think are actually relevant outside of the randomized layout
support.

Thank you for your understanding,
Miqu=C3=A8l

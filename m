Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E62F99AA
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124859; cv=none; b=cXsL0j337UIpt7Zfqen6QeOWG7LM+uvWP7f557VnnTnbbLp68qQMuagkNoCcYVZtbTr34bMvXFPj1HzSzaf2Fnwo3Y/Er2gf1Mgo+2gPknHqAofjYf2aO3UYt0P5RJEbnwL6VwfDQMyRLcTOWRmxcT+cbKXbMSjrUzfNyV64Bag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124859; c=relaxed/simple;
	bh=lhFpU/Ya2FpFsQ5qefHEf4YDuzs6g5hk1JCUojxtVao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rwOkxhHFM3joeemvShj7SOM0dkF4slllH3U2TG8zVMr/xXtVxhe8URyUlgLqe88ZlAhfRZwrnRty94RQ1lp6El08kdLCH64FSeEHuAZ+FJ8od0Wp8EYjh1tC+cn+wJZSE5n55H1ekuWAQWl2dmgKjqgPjtkRFt9pxTUamZBsy5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=erNkwFCA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="erNkwFCA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC1804E41268;
	Wed, 22 Oct 2025 09:20:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0D45606DC;
	Wed, 22 Oct 2025 09:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1794D102F2431;
	Wed, 22 Oct 2025 11:20:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761124854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eHlP+N8MaWcT1YqqHBfX7bz2ZZfGvtWUZIn+21jD6Gs=;
	b=erNkwFCAkRFjaCf2oyUivOub+gdPX16PZmEEWEZLvuhwpXm6I/Z3WCmtWxue3XYiY8380i
	rAzFBUTDYvUDqzgowQ/DS841hHO6nYltJgJufahq0+5u1e5TskGHD/Y8zUfFFoNcgzfdSi
	9gsG+qjYOzLgcP53U5M1YbGBvZJOs/Fd28fTd/8uPlLQ1j6zaLF6i3nRO6xMRP/ufiIfxQ
	YRdniBbR92fgQ0dnLBLOaaJeWJyocvvfIUefMp/OYFov2NQzQ3QYy1RpopqLq5OPATFKbn
	FPJluRTC+HambRECsW4lb8MOpQnitaTKBF8z9IDTH1WGp17XnXVQFuPJkCONnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
In-Reply-To: <20251020101311.256819-15-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:10 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-15-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:20:47 +0200
Message-ID: <878qh3thqo.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Richard,

On 20/10/2025 at 12:13:10 +02, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> The H616 NAND controller is quite different from the A10 and A23 ones,
> some registers offset changed, and some new one are introduced.
> Also, the DMA handling is different (it uses chained descriptors)
>
> So, introduce a new compatible to represent this version of the IP.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../mtd/allwinner,sun4i-a10-nand.yaml         | 41 +++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)

Please move the binding patch first in your series (binding then driver
changes aligned with the introduced binding and then DT changes using
it).

Thanks,
Miqu=C3=A8l

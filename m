Received: from m101-out-mua-6.websupport.se (m101-out-mua-6.websupport.se [109.235.175.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3E24BBF0
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.235.175.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722647; cv=none; b=nVaz5mpfACjzHea/7YbV/zy/UcIsnN8Ao2cEtNs2CbPXamIYK3s5cxvEnyLxYXxWpIjFW9LMx3IB9W1V9Mhm5zSCSkuXx41IzQgmfmBl31MGTDvIiwrpPCkDR/sMSKLMtlto/eArwLOBrZHvlegsOO/T0hCL8a/TdiDY5CV3hlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722647; c=relaxed/simple;
	bh=A5eSGIow4fx5QzKp7RQCuK7MK6VMGghXDlwz33QWfd8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihibRkrThhRlMsoqdfjI5vvqGvet3pq/lh8e6esSMuFNVzNRhGrnbgdrfIjoFazzBNnAhKfGmmveoPNeW/AfSvONaVy6fS9Rp0Orc7NTKWXYVL/RpUF7RAbwHMf2BDlSfr8k/pmRDJ3EAeoj6SX7CcREiMX52oJO6EJEXA10iZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se; spf=pass smtp.mailfrom=palvencia.se; dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b=PZGxsJNn; arc=none smtp.client-ip=109.235.175.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=palvencia.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b="PZGxsJNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1784722636;
	bh=BW7OEygY66DEhI2gw8GlDcm88r50fl2ii7fNHg4fiQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PZGxsJNnB+OFXdwYg3vSq7H0PZ9wkf8d+wjSIewLXQec5tpvQFZZav/DKzKbQJOBJ
	 yyWvCk6eIzphNAoON7RMUI/Hqka9xZ8MUfGOzCsqA46Xzw7H6s/mhotFsbrEFOixtR
	 39veTDQzlVvjiFTbwFcYOjHyMQoaKykqKE9W1hlQK7GCX+Bla9xHOR81YZBawzXEad
	 UvEEu5WVxt+ZqB2QoovzSydsb8nwalEEij+vthmwWPECLN/oiQZxBQHQF/HnwpIuSK
	 r7+lxUhsZDZdD6l77nW8aIyt7NrCMQ2XvsN9cxQoIYtIzRcfZgERrErj+4GI60cF95
	 Po0jzOFFPtQ4w==
Received: from m101-u7-ing.websupport.se (unknown [10.30.7.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4h4tY85C6mz1qYv;
	Wed, 22 Jul 2026 14:17:16 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u7-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [193.180.91.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u7-ing.websupport.se (Postfix) with ESMTPSA id 4h4tY621RkzqHv;
	Wed, 22 Jul 2026 14:17:14 +0200 (CEST)
Date: Wed, 22 Jul 2026 14:17:00 +0200
From: Per Larsson <per@palvencia.se>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Message-ID: <20260722141700.7fe240f1@rpi>
In-Reply-To: <20260721223956.13665-1-andre.przywara@arm.com>
References: <20260721223956.13665-1-andre.przywara@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_ZERO(0.00)[0];
	BAYES_HAM(0.00)[41.58%];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_X_AS(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev]
X-Out-Rspamd-Queue-Id: 4h4tY621RkzqHv
X-Out-Rspamd-Server: m101-rspamd-out-5
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1114
X-purgate-ID: 155908::1784722636-3C7051C6-336E3020/0/0

On Wed, 22 Jul 2026 00:39:56 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The Allwinner A523 uses the same GPIO voltage "withstand" programming
> (setting the input level voltage thresholds) as the previous SoCs, but
> for some odd reason inverts the encoding of 1.8V vs. 3.3V.
> 
> Add a new bias voltage type to note this difference, and select it for
> the A523. At the same time also use the newer "CTL" version, which in
> addition allows to turn off the withstand programming for I/O voltages
> other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used
> for Ethernet PHYs). The A523 has that enable register, but didn't use
> it so far.
> 
> This fixes eMMC and reportedly Ethernet operation on some A523 boards.
> 
> Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner
> A523") Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

I'd say this looks like the correct fix. With this (and removing
the incorrect voltage bump "fix") the eMMC on my X96QPro+ works.
Not seeing any regressions, so

Tested-by: Per Larsson <per@palvencia.se>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF62309F1D;
	Wed, 22 Oct 2025 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124051; cv=none; b=CNLbUr8+2wAae+st2/wu+7JwxdUqOiukWgH8EZxsRgV+lt/mOz8IA29Du5d0PJ5yDPbjtx32qywYwIdJD0i25e1m1dhn56vBsevEZCBJUSuwUfcwVLsSUOgbWgejpN+ngwbDkzbDDidAD9u4VQ33PEdZyZIdhXdo2FQGZdwzv8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124051; c=relaxed/simple;
	bh=CFgRIFMDLlRvna1V1YNxpinel1qHj26Ym1dQevPLhM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8xtqd6N5/nNr7vKBvy5RO7WshvcGRYPZ+9Bua5S0YxXhYfhLGTVj8rFke+HuM7/9gLj84zNh2VV0+4+57gRMVlRx/yPbzLBxdExXQEd2n5djh2W+e7+BtEokzIMAsTmr79VMGvvsSjrNmEfbGgMMgiSmgY3lbK90Fk7KH26H5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0dXllMz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0dXllMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F861C4CEFD;
	Wed, 22 Oct 2025 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761124051;
	bh=CFgRIFMDLlRvna1V1YNxpinel1qHj26Ym1dQevPLhM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0dXllMzAkMxnW5/HCfpu5O8VnH8RRiG0N1ipd4KFgGQY8kTTafhn3lKe3yUz2jo4
	 b3CI8iQggy9x6/LpG1XyflkUFqDDr+2xBzq3b9N3BCdseLEI0bIeGS717z5P+mLIsg
	 LCfRwkRXNVCXYM6geprxjBkTuMLOpVnabM5vVxhSe7uCyk6mpLQgdoiJnNSvkrYviN
	 k2gOc5yuh4cGN78HDSwEqWfUp8f4R5zDHx3Ibkj+6czn1Qkn5Wb5vjAmGD0ddUcdin
	 vaC2ZPaA0RtTNyyLliSJ6st/5k/NJJ4m51PKxHiAfyrQW9cSBwwHvaoX4e73SuOPAC
	 gOG/SPC8CGUwg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vBUoh-000000004Ty-2gqA;
	Wed, 22 Oct 2025 11:07:36 +0200
Date: Wed, 22 Oct 2025 11:07:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] mtd: rawnand: sunxi: introduce reg_user_data in
 sunxi_nfc_caps
Message-ID: <aPie167O32Jc6BHw@hovoldconsulting.com>
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-5-richard.genoud@bootlin.com>
 <87y0p3tiz9.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0p3tiz9.fsf@bootlin.com>

On Wed, Oct 22, 2025 at 10:54:02AM +0200, Miquel Raynal wrote:
> On 20/10/2025 at 12:13:00 +02, Richard Genoud <richard.genoud@bootlin.com> wrote:

> > @@ -723,8 +726,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
> >  {
> >  	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
> >  
> > -	sunxi_nfc_user_data_to_buf(readl(nfc->regs + NFC_REG_USER_DATA(step)),
> > -				   oob);
> > +	sunxi_nfc_user_data_to_buf(readl(nfc->regs +
> > +					 NFC_REG_USER_DATA(nfc, step)),
> > oob);
> 
> Minor nit, column limit is 100 now, so typically for this kind of
> situation everything would fit on a single line.

Just a drive-by comment:

The preferred limit is still 80 chars, unless exceeding it significantly
increases readability.

I guess here such an exception may be warranted.

Johan

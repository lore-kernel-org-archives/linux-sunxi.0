Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC298389479;
	Fri, 27 Feb 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772188820; cv=none; b=UHUBhNZqCY6JmU4W4y9zjH28sWo2DClRlaljckEIHlqbs0SmLqlSYK9VLb8JH3XbUlZ4q96NX+pPDy6nW7b2bj+7dut5ua0nGeF384GOetOWD4cYFX3cPck8zXHVyKMpLLXdwZcaLwPGCwms05e3cr0vgka0gfkVe5ijrTsrWhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772188820; c=relaxed/simple;
	bh=S38SLBCjfp+AviharV2czcJGeaKtssqT1mwXbk9V334=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH1DQIv4g1dy5/vifbnceFSXaqsbV0y3qFubIsO+2h03FvZOHfazLL1XB7aWDh+xDZ9SaxlIhvgq5NzRP8qVTybKV+6uJUmk5KUjiIyOF6JOpXNECbTDJwprrp/zGH6JyBgRVdNiGOqYXXPNxtpxo41/ADf61WgAhUb2PVDeJjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahFpxODv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahFpxODv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEC7C116C6;
	Fri, 27 Feb 2026 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772188819;
	bh=S38SLBCjfp+AviharV2czcJGeaKtssqT1mwXbk9V334=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahFpxODvVhaoTXhINZ8PapWNjPNOxSGRKm1eBCcKgxQnM6cnWCcDgkJx4f0VydY9q
	 6upcZ9PnTHHoaQOkDDFrEIt6hyp5tWz/UyX7YvlV4AOi3QmvQFM6NyRFwpJYDtFDFj
	 n8QCST3EbdA9HYrQ9nsec//xdNTycPHzOi/KnSmz6vjaPJYsr+df4acus/GM25RiA8
	 FYmdeeQawkgzIIgDZqPFYrRKo6p8D6xKbwGOe3cgqVSmcSPnnxCWUWplzGwH3c6Pse
	 T43f+D3ASkb37c3zdVF0HtDRXvbNrXlkXnh7IJOdHBQNfZU+ughe7raKYO4hGJTru6
	 01vIJcwZFzTcg==
Date: Fri, 27 Feb 2026 11:40:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, mripard@kernel.org, robh@kernel.org, samuel@sholland.org, 
	wens@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Message-ID: <20260227-placid-rare-markhor-cfbdb6@quoll>
References: <4d6c13d8-fd06-4cf4-9ac1-0a3e595092b7@kernel.org>
 <20260226152702.42051-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226152702.42051-1-jerrysteve1101@gmail.com>

On Thu, Feb 26, 2026 at 11:27:02PM +0800, Jun Yan wrote:
> > On 26/02/2026 09:48, Jun Yan wrote:
> > > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > > infrared input.
> > > 
> > > It was released by UQsoft as a blockchain-based terminal and is
> > > now discontinued and no longer supported.
> > > 
> > >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> > 
> > This name and footer at that page suggests name "ultrapower" not "uqsoft".
> UQSoft (Beijing UQSOFT Interactive Technology Co., Ltd.) is a wholly-owned subsidiary of 
> Ultrapower (Beijing Ultrapower Software Co., Ltd.).
> 
> TaiqiCat A01 was released by UQSoft, with its product homepage[1] hosted on Ultrapower's 
> official website[2].
> 
> It should be noted that UQSoft's official website is no longer operational, and the 
> company is seemingly discontinued.
> 
> Therefore, I think it appropriate to revise the relevant information to Ultrapower, 
> if this is acceptable to you.

Yes, please use ultrapower in such case. You can mention all this in the
vendor-prefix patch.

Best regards,
Krzysztof


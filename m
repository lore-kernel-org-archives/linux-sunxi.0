Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B75136D500;
	Thu,  7 May 2026 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140744; cv=none; b=FDZrkd2He7P46cOwmTza6llDsAVn6Ogjaci6+To9LLEl5dxscJp07xyN86HFfzcvwdeu7s2HJIB5okz1GeeUk1biik3LQ0K210cZn0iMAUPTc28MoI/Z/LEx/RI3aHMVxEZmmezuf+VELfOeWgXpar/2joP8ZFfz2dkSTwdxlT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140744; c=relaxed/simple;
	bh=xtObYg+ANCVDJnkLc1ovOBDnaUn/a53iua122Vbp1zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQNoOV98D3x2u0/cUjR5zpK6zbr16F0bcLby0fO4sU3oDi9aQQlacFpAtuIEu/3AYlfd8K0Afw9timdmtmpD/V9YPDcW2zaFTIkzsi1nUVBtc5w546PwJGfQM6GkpA61VO9vjagmq7vS+EjT2NUPuGVoZo0CzBE5H8RDK2MCCL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=owMTALbN; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="owMTALbN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mZ33xPlUL2vXp7mn5fh4LEunhT/STrANGl0lt2s6JO8=; b=owMTALbNmq/0z0AKTGDegzz/CJ
	t6eyihkojOWIAhUG2+VqzDF+QWwKDov6WQt6gpB8SQ6Ud7LoiK+h5IHHCMv/eYSUsldGd5imS7aae
	exyx5b3HxD8VBF3o12MBcwKgSAz5g+3jyhpcUNTueTJWBe9xRHoqvX5pWLwPnxrVUY+b7xoMQhuKu
	Swvdp4+x2S3JsTdDVidg5TkQ17WVTIbn1a00oFfE6FRUP+XkYMuBlPahkj44Ll3t7ojmAmzBEYdJa
	huTGMTYZbvB1JoukeBp2rXSk1fkYvLKj/dYwEQlRUanUKU1QK+k4KLqcs3kZ6RHP6PhIH9dHAo0bQ
	YlDu7LSw==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKtdK-0000000FO8y-2Dia;
	Thu, 07 May 2026 09:58:58 +0200
Date: Thu, 7 May 2026 09:58:56 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
Message-ID: <mz3vsc7ukwkmgcqot6uo74h3ibcbqw7kus5abcficg4z5unitq@xzkmeovc4ntj>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
 <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
 <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
 <c10e73df-4850-4507-8c8c-5e1b5e24f99b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c10e73df-4850-4507-8c8c-5e1b5e24f99b@oss.qualcomm.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl

On Wed, May 06, 2026 at 05:15:49PM +0200, Daniel Lezcano wrote:
> On 5/6/26 16:41, Michal Piekos wrote:
> > On Wed, May 06, 2026 at 01:28:22PM +0200, Daniel Lezcano wrote:
> > > On 4/28/26 18:26, Michal Piekos wrote:
> > > > Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> > > > and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> > > > 
> > > > D1 and H616 uses same model as existing driver except register shift
> > > > compared to older variants.
> > > > 
> > > > Added register layout abstraction in the driver, extended the binding
> > > > with new compatibles and wired up dts nodes for T113-S3 and H616 which
> > > > uses D1 as fallback compatible.
> > > > 
> > > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > > ---
> > > 
> > > Applied patches 1 and 2
> > > 
> > > Thanks
> > 
> > Thank you.
> > I will spin shortly next version with suggested correction for patch 3.
> 
> So patch 1 and 2 are unchanged in v4 ? (missing reviewed-by: Chen-Yu BTW)
> 

Yes. Patch 1 and 2 are unchanged in v4.
Sorry for missing reviewed-by. Was to quick.

Michal

Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F18421EF4;
	Wed,  6 May 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078510; cv=none; b=SLCOcowO/T5/iaRoiVxiEhWtqcbE+CjeCwIXr8Us7hGD6X8KHujVJef3vZDRes2G3o2YgagjlFwPQ30yM+/eqDnJFS/j/X6h9wt6wNewBV0rx87Z8NiVjCoaajVDLWmnFmXmhXa6BUJcMMeJbIpA2H7UB0Ax3g9vEiLA1JqrhCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078510; c=relaxed/simple;
	bh=MvV8LT9Upk7tt6hpagp32+ZlRB49FqmsPLyhxXbUSn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mT+VdN9Lgjwg22jhAWuTPf+FBujufKLFBROR1XRqjE9IhvGooJcVlCubWetbFDrbH7v3dwTi+DuRlOgTtUYuGcqhCIE3uMdhNJkAnXWdfHR/feN7RP4uEY9+yYeP5EGnF/S2b216g2RFKCnZCHa6/p5CsCPGLVN5c2ywiRMhCHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=AoMib4LR; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="AoMib4LR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yXHnTFm/jz6IOHwyiTUt/ifrClYh1+7TWnaI7EM86Wo=; b=AoMib4LR186B7JTqrzSkG8NmF+
	wZcE6eNSzrAKIMfytyuJy9EcHrDK7oMnx3JWmj8KgUckTWPo5naYsc+nyyz1otVq5e78E5/Anm+FJ
	E3e1veare/NDykhAtq5qpOLog02PaWwz/vdwJ9N9X1SOkQ2irAzQbWKmXBM+6ETDOSNVxXZBh3DyK
	rcMggHor8T8qXgZqRr8ZVZuZADLyOtG3YwnUxEM2XurEzdkZHhZu1qAxrRTvgBjxbZXUozhgOHYXo
	26cAB+9/cb2Y4P4XCdxyF0zCcv9nRiydCyPlSwa9p+8u5DVAoB2RY/zp04ad2NXFnJi0M18R+7moh
	HtRyDy9A==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdRX-00000002h7y-1JVL;
	Wed, 06 May 2026 16:41:43 +0200
Date: Wed, 6 May 2026 16:41:25 +0200
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
Message-ID: <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
 <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl

On Wed, May 06, 2026 at 01:28:22PM +0200, Daniel Lezcano wrote:
> On 4/28/26 18:26, Michal Piekos wrote:
> > Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> > and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> > 
> > D1 and H616 uses same model as existing driver except register shift
> > compared to older variants.
> > 
> > Added register layout abstraction in the driver, extended the binding
> > with new compatibles and wired up dts nodes for T113-S3 and H616 which
> > uses D1 as fallback compatible.
> > 
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> 
> Applied patches 1 and 2
> 
> Thanks

Thank you.
I will spin shortly next version with suggested correction for patch 3.

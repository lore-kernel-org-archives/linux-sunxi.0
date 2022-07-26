Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397857A
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Jul 2022 09:27:16 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 4B819D0F63
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Jul 2022 09:18:29 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E3B5E240004;
	Tue, 26 Jul 2022 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658827101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1eMPxwGGLuK4IaY+cx04zGWguw85HqB8nrDHBjS2bvE=;
	b=LIXKMkHO0ZoUb78Q5z2bxUyE/iB1Kd5JHG/epodcYEqn/M7hU+N4v+yfwdGHQ1dboD9yYt
	uAe0YYDTCdLFavOWUo3TmpoAHfhZn0Pt0x+CU66KzadS8G+ngisxlsym9Wf07oCcJxbRlG
	RgYVUF2OpN4cyCDG7xe6RyvC+StobEQFth/d0HeQao8omhT4sordQeSYXA3TEzvSVq5WKW
	2OeUayWj05LLtOO+ztCC/uCxevkc8liSOYdSFHOV2kSvXFm9PFRmjPpwF0HDKgkHOb3EPL
	lMIdKzh3qLzMlX0+nJ1uplyTR8loOcvsybjgEjjSQ23ZPC471FBhI/BujVYByQ==
Date: Tue, 26 Jul 2022 11:18:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: samuel@sholland.org, a.zummo@towertech.it
Cc: jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, icenowy@aosc.io,
	linux-rtc@vger.kernel.org, wens@csie.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH] rtc: sun6i: add support for R329 RTC
Message-ID: <165882703251.3139893.611019968302494887.b4-ty@bootlin.com>
References: <20220626042756.58961-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220626042756.58961-1-samuel@sholland.org>

On Sat, 25 Jun 2022 23:27:56 -0500, Samuel Holland wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Allwinner R329 has a RTC with a similar time storage with H616 but a
> slightly different clock part.
> 
> As we have already handled the R329 RTC clocks in the CCU driver, add a
> compatible string to RTC driver to allow probing of the RTC.
> 
> [...]

Applied, thanks!

[1/1] rtc: sun6i: add support for R329 RTC
      commit: b9d982385d0544132bc398b7a7e062d9a554d941

Best regards,
-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

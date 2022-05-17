Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6A1874
	for <linux-sunxi@lists.linux.dev>; Tue, 17 May 2022 20:57:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 1B479C9FAE
	for <linux-sunxi@lists.linux.dev>; Tue, 17 May 2022 20:49:53 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AE690C0008;
	Tue, 17 May 2022 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652820584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTwYHMZ9AJOOz5QnG1101HT1nNGvfTsi5HXdvlLVRds=;
	b=DetHmiIWHV3mClxsq+hjnBmKx1krmZB5xf2D5gk9N8d4QYaDxnWHnOMYcQEKH3/Z+LEh8X
	I/dvHcKF7rOlWli54pHqXiuhcJ/k873gjzWfgmwNxN6lNdUd3xQspwgxepRsgKvBTownhK
	gw+lY0Cgsgl1np6svUshX163QzMkq5MSL5XAB0rcP3wYLChBQnp1GoG6+ulyvSAU26E42O
	q7K1Yqoou0qU8wjVeNLEmY89F8+LaEhCzuUUlM5tq6cRxOfaDYRYeyIJeN70shrrjBpl3F
	SoykS6Ef8EzolhHF3PU01bODKA+01uytgOb/HK7j0C6GdtBG99YJQBoiibONuQ==
From: alexandre.belloni@bootlin.com
To: Samuel Holland <samuel@sholland.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: Add NVMEM provider
Date: Tue, 17 May 2022 22:49:43 +0200
Message-Id: <165282057545.288453.15330991918846151117.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220413231731.56709-1-samuel@sholland.org>
References: <20220413231731.56709-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

On Wed, 13 Apr 2022 18:17:30 -0500, Samuel Holland wrote:
> The sun6i RTC provides 32 bytes of general-purpose data registers.
> They can be used to save data in the always-on RTC power domain.
> The registers are writable via 32-bit MMIO accesses only.
> 
> Expose them with a NVMEM provider so they can be used by other drivers.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc: sun6i: Add NVMEM provider
      commit: 581d6d8f483696ff164f52a71beb43a87b718592

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

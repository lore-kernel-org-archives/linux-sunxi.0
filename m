Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3AECA5D
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 07:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A379C433CA;
	Mon, 25 Sep 2023 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695627921;
	bh=d5HRu8E3T8PlMucp89AFZaeFnM4xuCGURMulBdsftuc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AuDrplQfoyK0oYMpRBAWhHQgA4eO3/i7blRD2DiY4zqJpwDHJ8OfudMcercfjTF/G
	 qqOkunfDb4A2g3pnsIoDzQcfMPIVCUjF8UJdWsXDm1y2wgmqrzpmz68jQHU1x69Lqr
	 +0djr1b3TPFEM6hOM2jjKxXYclpnzMSJEiRcQy4QbuAecDOGjE4WlljnUEARzPanlW
	 IwjeQAvLJVmRQ+xbc3AaQga2VR9tS9KYFYHj54nWrI69Z3lgmqhv+gIf2kusfyk1n8
	 kDASnZmplaV9PgubXpW67Y9CQY+7qOudbuxneBx/DlwCHsRnhSxOCagrI2SD+y9l4F
	 ckFy7PnfeC+Dg==
Message-ID: <50beeef703d81daeb00599b60ecdfa61.mripard@kernel.org>
Date: Mon, 25 Sep 2023 07:45:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 4/7] drm/sun4i: Don't show error for deferred probes.
In-Reply-To: <20230924192604.3262187-5-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-5-jernej.skrabec@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, mripard@kernel.org, samuel@sholland.org, wens@csie.org, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Sun, 24 Sep 2023 21:26:01 +0200, Jernej Skrabec wrote:
> Drivers probing in display pipeline can be deferred for many reasons.
> Don't print error for such cases.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F110956
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 07:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B70DC433C7;
	Mon, 25 Sep 2023 07:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695627829;
	bh=myK966qEnI1fuOXxADF5RQjS2NfbvQRXNNgyejzLHj4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=UiCDSEHjLXz/jLtBbfWl5B4S4Ym9uBq6RwMJ2p0h2hAqwrzdaoRMdzJVQFpLaCY80
	 /GVuxtcqij0XH/qOz/JOQysqGiraJ7Iun7zmySqKQQO6gta7tnHaWYvtJqchzYCm5+
	 35e3OF1s2aAadcVaMtGl1/8S/1weII6ctTObE2d8J/glGGmqR0bFo4JoGkJk2iWFXv
	 wInst2oS4ylO5cRscPZCJOFj8BTtLV+/ORMNPRdScKBJqx1kVG+KVFXhS8aYDPKhE3
	 nLAPggpGza2ITIDwdAMZ3YdlwlWgj3DCOFS+d1Zfw9LNePzjnsEQEPv/YC5hUU+Kt/
	 KL3lZRS39smWQ==
Message-ID: <42011ce6616bfb7bda5337a94c19b287.mripard@kernel.org>
Date: Mon, 25 Sep 2023 07:43:46 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 1/7] drm/sun4i: dw-hdmi: Deinit PHY in fail path
In-Reply-To: <20230924192604.3262187-2-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-2-jernej.skrabec@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, mripard@kernel.org, samuel@sholland.org, wens@csie.org, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Sun, 24 Sep 2023 21:25:58 +0200, Jernej Skrabec wrote:
> Commit 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform
> device") removed code for PHY deinitialization in fail path.
> 
> Add it back.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

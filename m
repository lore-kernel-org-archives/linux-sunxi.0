Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CED47F2F6;
	Thu, 13 Aug 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628141; cv=none; b=b+AGyQLQFNCzzZulSxl7igknzGIkKlsp46SZY3HKKzbBqaCtsPWScwkkux4hovERcA968U30ZaWIPqmC2JXlCFUKjOlnp5QDPeM5FYDUzk0Kj+zGcs+WngwNV40DNdyr2IjLrPg//Op1lAh5jmEhDUWJ5AuexAWxU6FvUUZ/hoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628141; c=relaxed/simple;
	bh=O0+gd88BoOH3G0t+yRLaKTw7fphk7vgxXHMBO9l5Fes=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=iurMHbYzg4s9+oLK7mpEHQGYwlGvDNLSg9uYI4XtiulKiiikUgBe1hXjETvwWVdvGHdMRwUXgPtXZ0qzLzdIXRPcuA3EcV0+pAv5irj5x8T6qc0NsvAEZFjLQa88ulbwJJp22q3hmf6xZduYebN+EsdyYa0RppElyxfn6PnP468=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3q5vIKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3q5vIKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F7D1F00A3D;
	Thu, 13 Aug 2026 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786628139;
	bh=u/QNXzsOaE2suX66IMMLbQ/FeLVy8GcdhacP7ftayeM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=P3q5vIKYkO+QFEOTZ/q9tTT8RIztZL1ripaVIZXGvUNRXzITdErUVVhW0wwHEf2Iv
	 qIqrF6DwiTxpwNPlf0CpaYgzEWUYAaAM/XX9vkEdmiZ0817ZjGhE/ROuMDi4zsikQt
	 1YMRJW96FTuG4pVqSq//uXBgsqpzaguvqEf+MWXHn2gG5K2nerfXuBwV6afKQ7vXM4
	 vSBf9YCjCDMhMCV3HmpbKOeWjCaMnP5W7cUKiw233n4ufLrZg6gAWegEWq03oZcxgh
	 1OuTn+yOMKDmzb2EElmcTABf0p+NrFplMfEaFekJC6Dfi3YIUWydkqJZG29VMfHJYm
	 iVFjgW8B7/4qw==
Message-ID: <59d73aba5b4fcaa2b645a433821ea7aa@kernel.org>
Date: Thu, 13 Aug 2026 13:35:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 20/69] drm/display: hdmi-state-helper: Add source
 TMDS rate validation
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-20-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-20-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maud Spierings" <maud_spierings@hotmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert Foss" <rfoss@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Sandy Huang" <hjc@rock-chips.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 31 Jul 2026 19:19:27 +0300, Cristian Ciocaltea wrote:
> Validate the computed TMDS character rate against
> connector->hdmi.max_tmds_char_rate, when provided by the driver/source.
> 
> This gives HDMI connectors common support for rejecting modes whose TMDS
> character rate exceeds the source supported limit, while still allowing
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

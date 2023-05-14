Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577361FCE
	for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 21:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79531C433D2;
	Sun, 14 May 2023 21:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684101388;
	bh=R1e8V9jPCIYXD/S9SJh67OIR8g9mBP1aWfHDXH4v3PE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E6pO7/M9tDV39rvpeU/vlP1n0n/qh17rgfX4csYAEjvuKGW7AFITCJWXGdJA+/bnB
	 P8+ha92Xc4fRdhMyPu+b1IFpxCedZa2M0ojB7V3QKZ+tzKYQW7FE2d+WzghhEmYk6J
	 tVUV8qCU5jN4JTaZf/BxevDnPPcSBOA++bXg8Pf8DPr8nPujzA1GdJI8sZSVrAkVde
	 fcXVI8xxeEUv4Vjf/n5pajRlzdL+loSOvgVCkk+Gc2UOJU/yn1AbYbAD53hn3taQSU
	 XzF1fkb2wOLcQ7hMJ61Sq4ZK745Ddd4kHEdu8DRIZCjdjw7o/x0+HdXMQaNlHgEO2l
	 0ErrgYF6LY1/w==
Message-ID: <30ebd0b4-c079-50ad-9320-395b38cc132d@kernel.org>
Date: Mon, 15 May 2023 06:56:24 +0900
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ata: libata: Make ata_platform_remove_one return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Serge Semin <fancer.lancer@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 "open list:LIBATA SUBSYSTEM" <linux-ide@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
References: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/13/23 05:46, Uwe Kleine-König wrote:
> The function returned zero unconditionally, so the function returning an
> int is something between useless and irritating. With the goal to make
> platform drivers' remove function return void, it's helpful to convert
> the function accordingly. This converts several drivers to the new
> .remove_new callback that was introduced to smoothen the platform driver
> conversion.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to for-6.5. Thanks !



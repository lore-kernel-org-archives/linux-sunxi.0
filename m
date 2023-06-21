Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1251B908;
	Wed, 21 Jun 2023 20:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1674C433C8;
	Wed, 21 Jun 2023 20:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687378344;
	bh=8RXgYeONVucyquW4A3CflngjSvC4JEQrRvUxtAhm7HA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HluFPHhN5+SHUh/irMDQj0oGOleU+xATOkRWi+GmjbDeIE6sGPwiSLqeozIXyD8Ed
	 00oacTdK55HACZf0v3FAPpjYkUbeciFTToOHTnazkPCp/VP3UMUR/IinxZ80uizWeV
	 PUi4/n8PbTKupr3afYHg3EmdRqCMWhksgAzHc3epQKfOG0H6mfxHdSm91241Nco/1E
	 Um5GOtfegPeC9Ls08dhKZ3MZkmd+i3RygrJWpKoO8Aw/ulsxgLPJDOmsQ4/wcNmYf+
	 vxL5XI1ZkXGZBBOrszxV+u1IN5oQohQN5ZJ+3bRZlP4hjjSX03JwdxjXGTd/BfrLxR
	 UuoRnT7oi89IQ==
Date: Wed, 21 Jun 2023 13:12:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Richard
 Cochran <richardcochran@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 00/12] net: stmmac: replace boolean fields in
 plat_stmmacenet_data with flags
Message-ID: <20230621131222.071b9fc3@kernel.org>
In-Reply-To: <20230621182558.544417-1-brgl@bgdev.pl>
References: <20230621182558.544417-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jun 2023 20:25:46 +0200 Bartosz Golaszewski wrote:
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.

Is that what Jose meant, or:

-	bool has_integrated_pcs;
+	u32 has_integrated_pcs:1;

?

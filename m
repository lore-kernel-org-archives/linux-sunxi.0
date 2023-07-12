Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B387F9;
	Wed, 12 Jul 2023 03:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01898C433C7;
	Wed, 12 Jul 2023 03:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689132075;
	bh=/NuFIWfEtVjk5MvroN0JIwWzQv+7JB4TBDHgC9DyCxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nsHuyOFlOfGP8W5cNrlZS+JZtz4WNfbJ3xNhO/Diz6kJf1YahQVGjiWGISpV7KKkO
	 SirSzT6+Iey/kn0zRhDR5DEKmJRQRDUDYaIOJXh+ahNGgXUyRs/qMWi9Glh+7rhHx3
	 XTcq9L/IpBB/hq6c+CgQ4A+aTeOrE3SGjsDTzhzPuJDCEBVcOEdkrR0xBM0ns9TtBs
	 tQKqpy6SrlL5py4Ykit+ZGJ/2RIwTeaZHeIPEyg3vqiug1bzHGvpQ8LvFiTbXieuwv
	 xAnG92vdQu8FVifLfMdDuJjN3sBdbWU0WzPk+1Wi0aVV4FFcLtH7kVGdpvpv+0dXFJ
	 lQF0uJuPrGRSA==
Date: Tue, 11 Jul 2023 20:21:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Torgue
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
Subject: Re: [PATCH net-next v3 00/12] net: stmmac: replace boolean fields
 in plat_stmmacenet_data with flags
Message-ID: <20230711202114.5e4f1dcd@kernel.org>
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Jul 2023 10:59:49 +0200 Bartosz Golaszewski wrote:
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.

Peppe, please take a look.

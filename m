Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B42904
	for <linux-sunxi@lists.linux.dev>; Thu, 19 May 2022 17:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8A7C385AA;
	Thu, 19 May 2022 17:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652982913;
	bh=aPWY8sZpDKBG9IVmJly033REednRet4biZs+QQWIXvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkHVf4qT2r2qjFXDG5mX8ODHxZ3mGWaypKoe8j3/ITHb8h5M7mxz2mF8avfePZw96
	 ul+E5URZ/6RuBrII6QSKPCXjx8uBbNMoCpSBINA7VnfN9ElSSkArUPAbNJ9Ri7ZIkP
	 jm5vFRvo0DL6J6niIUgTCIil7YViTMqVEEMB08p/QL4yRH9x9KoTeBnOUABukXzILd
	 E0yGhYFm/q3koGH6btbdFoTvmzKWYFWYBnIOr2VJ6IElWz6V6cZNNCcsFAFej//zbc
	 4afLCM15DyBuxQN/Sw8Sbkpi+48frEl/xzAaW/4Mnc6SGfo9No0OjQhrCngGzevycF
	 Yia/immbVA49A==
Date: Thu, 19 May 2022 23:25:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 0/4] dmaengine: sun6i: Allwinner D1 support
Message-ID: <YoaEfDnWD6kTOxfJ@matsya>
References: <20220424172759.33383-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220424172759.33383-1-samuel@sholland.org>

On 24-04-22, 12:27, Samuel Holland wrote:
> D1 is a new RISC-V SoC that uses mostly the same peripherals as
> existing ARM-based sunxi SoCs. This series adds dmaengine support for
> D1, after fixing an issue where the driver depended on architecture-
> specific behavior (patch 2) and resolving a TODO item (patch 3).

Applied, thanks

-- 
~Vinod

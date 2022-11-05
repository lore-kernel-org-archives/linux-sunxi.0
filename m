Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28791C04
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Nov 2022 07:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95302C433D6;
	Sat,  5 Nov 2022 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667634351;
	bh=oR4nin9GL/nLMFNCIKIq01MhwItWEG8E93FtnI2llfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/mNHZ+RpReyyDqxhUaRYAgyXHdz37fOA57eOSMjuAoNIVU/78Q/gJSbnWirNhPzk
	 nwINsKMyhyq5PGTaIj3pLqa5MXkdC1Q5C3FbzXKDgjAaT4I33HENPmf6gq2L21YMd4
	 HI6MKxv9eN84lFPb+CTGBT/sHtuvcvMmWuj0RNhEof6KwpPyc5EtImLES8HIcGAZtt
	 zEdo4RLupRlBOGnC4nyzjsL2XtN4UDkG9bBuCaTybVUj1oKrHilr1GztdrYCOJEAU0
	 tYqRSS/Y31LGF6w8JqQz9hKvIpcHgmvJnUbyADXuGQPEqscqy+H/JGkJoUog1HHSM3
	 gRkaxZaxQmXkA==
Date: Sat, 5 Nov 2022 13:15:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: Add special clock for Allwinner
 H616 PHY
Message-ID: <Y2YUq1IWzjlkVOuz@matsya>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
 <20221031111358.3387297-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031111358.3387297-3-andre.przywara@arm.com>

On 31-10-22, 11:13, Andre Przywara wrote:
> The USB PHY IP in the Allwinner H616 SoC requires a quirk that involves
> some resources from port 2's PHY and HCI IP. In particular the PMU clock
> for port 2 must be surely ungated before accessing the REG_HCI_PHY_CTL
> register of port 2. To allow each USB port to be controlled
> independently of port 2, we need a handle to that particular PMU clock
> in the *PHY* node, as the HCI and PHY part might be handled by separate
> drivers.
> 
> Add that clock to the requirements of the H616 PHY binding, so that a
> PHY driver can apply the quirk in isolation, without requiring help from
> port 2's HCI driver.

Applied, thanks

-- 
~Vinod

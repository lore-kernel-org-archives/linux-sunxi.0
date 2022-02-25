Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67B87B
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Feb 2022 08:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE074C340E7;
	Fri, 25 Feb 2022 08:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645777483;
	bh=d9Uy2ioP2Sl9I8LOHRagRhdSaAoY2P57qNiGvE7DJF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGlDJkWZHxFJLs4Q/Vb75zUX0yT0U0veE1ybn+rPHa8UmPzRAZzqYj5ZECv9vR/ee
	 1/OEEl5gm0gAR/pMiLUeDG3ydgVVgfXLKVdyt/YauhEZ5L9DACw9Vpvkfqx2rwAjv6
	 /2xEhpG1NlaaFBzEolkPApV4WmRIkfrE62kgblLR15oxGjmfyt03fQZgLdj0YKHI5p
	 2+2eyrlxVIW58RyKh6fM/H7gkhlL0yIZGYOG4aPHubb6TVvnc9eMb52ybVRqARECwQ
	 cpV1U6Ge07Ft8UteU/6GizOwhFqqNT1g4CiN7jOJo5JT2o9q/8elNUAYhiyN4013Gj
	 G9htmeIDt3TVg==
Date: Fri, 25 Feb 2022 13:54:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: Add compatible for D1 USB PHY
Message-ID: <YhiSRzO8MqIjRNuR@matsya>
References: <20220203013558.11490-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203013558.11490-1-samuel@sholland.org>

On 02-02-22, 19:35, Samuel Holland wrote:
> D1 features one OTG port and one host port, like the A64 SoC, so its
> USB PHY supports the same set of properties. Add the new compatible to
> the existing binding.

Applied all, thanks

-- 
~Vinod

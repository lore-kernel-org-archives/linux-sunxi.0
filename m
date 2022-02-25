Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A97B
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Feb 2022 08:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBFAC340E7;
	Fri, 25 Feb 2022 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645777452;
	bh=wUTRPoZn8BBAycadtcQaV6M3VNL/c4t5P7L45uO3280=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1O9sO5wWbnSx3EvC2Z4tnYFNbOV5Q7hLiP08crAOSllI0TO/SUTUSRSWk+MSIWxB
	 KqVrA5RiWqGTQhe7zKDuRk3KKUlPACENjLk2UQEqjgF/Q4ZfJ/WXwqdmS3nWVazfGo
	 V8gpaasvP0cZ/VnwSPd8Q3dr7DrkLp/cIHDzzpsQWnZy2SO2HHN0Sp3pOq0I1M+P61
	 NeyDcKuAfqftetN8bMsSgzVUXeHHjbvcSB+jRTFyXRAPsWaJ8Qi5uprYIi63GY/5Hc
	 8WmphOFf8jn/QnBzzcp8PuLMocxWhibDRCt/fdPoOnBnnbKd5qRtxxeEsqyyc++6Tm
	 /Kx0oXkuJNmgA==
Date: Fri, 25 Feb 2022 13:54:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: Add compatible for D1 USB PHY
Message-ID: <YhiSJw1fhuyQF2Lg@matsya>
References: <20220203013558.11490-1-samuel@sholland.org>
 <YhiRyq7k5jtSKlni@matsya>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhiRyq7k5jtSKlni@matsya>

On 25-02-22, 13:52, Vinod Koul wrote:
> On 02-02-22, 19:35, Samuel Holland wrote:
> > D1 features one OTG port and one host port, like the A64 SoC, so its
> > USB PHY supports the same set of properties. Add the new compatible to
> > the existing binding.
> 
> Rob?

Never mind, b4 found it... Somehow my inbox doesnt show it... 

-- 
~Vinod

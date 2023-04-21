Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F54D20EE
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 07:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E43C433D2;
	Fri, 21 Apr 2023 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682062340;
	bh=LupbggItcXQ6NTf6z/Xh7ZMsrzDnQEBz/D9rsNfGSjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxONRrLNwqSTkCtReNhTdhpbB3QudDltcy6Y6L0XpsG32u92bept0TvbEuFIwjo0J
	 U3EzNmEBiOF+tieHoaeeeU9JuQx1+DG3lMwQTtkZDJXqG2pcvpnmu4ET4XOaLV2eji
	 o85qocDsfjDpOrtnWC+2gnxKDZXJttqamGIUxjjxtrF4KIRotMm+T9fKwLkS8TvGAa
	 /JCyJXr67opDXdKH/WP3P0JNBMhyP/ZnKCNK/yWtsACCF6K+nm+J7FjtXcykzbrrrk
	 TcNcm6Z/DRH4TJng1nnwazQ/Xw7Vjrwjt6lH2f8jW9mqwswKl0xnEJRMscJ//jPvaN
	 t6pSOdBqAucFw==
Date: Fri, 21 Apr 2023 08:32:14 +0100
From: Lee Jones <lee@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com,
	Shengyu Qu <wiagn233@outlook.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v10 0/3] regulator: Add X-Powers AXP313a PMIC support
Message-ID: <20230421073214.GN996918@google.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401001850.4988-1-andre.przywara@arm.com>

On Sat, 01 Apr 2023, Andre Przywara wrote:

> This patch series adds support for the X-Powers AXP313a PMIC, which is
> often bundled with Allwinner H616 or H313 SoCs.
> It's my turn again for this revision of the series, after Martin did
> v7 and v8.
> After some more significant changes in v9, this is fixing some nits,
> and builds on Krzysztof's patch to simplify the DT binding document
> (patch ID at the end of this email). For a complete changelog see below.
> 
> Up to v5 this was speaking of the AXP1530, which seems to be some internal
> name. The chips we have seen in the wild are all labeled AXP313a, so we
> go with this name here, from now on. This is supported by the fact that
> there is an AXP313a datasheet, but none for the AXP1530.
> 
> Patch 1 is the binding documentation (just the new compatible string),
> patch 2 adds the MFD bits (mostly describing the extent of the regmap),
> while patch 3 describes the actual AXP313a register definitions.
> Since this ties neatly into the existing AXP and generic regulator
> framework, the patches are indeed only structure definitions, there is
> little new code.
> 
> For now we papered over this "fixed customizable" RTC-LDO regulator in the
> same way this was done before for other PMICs (AXP803, for instance), We
> think we can fix this properly with a follow-up patch, for all instances.

MFD patches applied.  PR for Mark to follow.

-- 
Lee Jones [李琼斯]

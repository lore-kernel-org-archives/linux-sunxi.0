Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166C5185E
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 07:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB0EC433D2;
	Fri, 21 Apr 2023 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682062227;
	bh=XrGuLcEdkelka+uFCfne3EDP3nhNBhhS1Vyb1/CHnnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGE6KtXinVCLyDv32PLRlc3W8n2DcfkaXG2yFhJrmhP3CvW5oT0n5xDWNumemnU3G
	 fWXpEIrZfWHELYyBmENqZUPWK87hrH5AchAOcjWKp7g2FOjUnsOJE6h2OAmqWNkPYC
	 2koApwGRcNm05Cw3xMJEGvICcU1BqsrVdE0eABlyfTphIsk2NTFHJLLg+Touj2F3AO
	 TbJWLFwJWEO5TqqIau8WlxUi5T1GbbClG7fbbiKM4fzUnIEnpQ4vUO+OsnkJamHJxH
	 JLg+umhNz7pIuQ7zjuID6j4hs/irW6BchmDlPPUYWTLOBiJkxKGl2C169TvhKLWzUQ
	 enmNQk1vl+RVQ==
Date: Fri, 21 Apr 2023 08:30:21 +0100
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
Subject: Re: [PATCH v10 1/3] dt-bindings: mfd: x-powers,axp152: Document the
 AXP313a variant
Message-ID: <20230421073021.GL996918@google.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
 <20230401001850.4988-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401001850.4988-2-andre.przywara@arm.com>

On Sat, 01 Apr 2023, Andre Przywara wrote:

> From: Martin Botka <martin.botka@somainline.org>
> 
> The X-Powers AXP313a is a PMIC used on some devices with the Allwinner
> H616 or H313 SoC.
> According to the datasheet, the DC/DC converter PWM frequency is fixed
> (to 3 MHz), so disallow the property that lets us set this frequency
> for the other PMICs.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/mfd/x-powers,axp152.yaml      | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied, thanks

-- 
Lee Jones [李琼斯]

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E003E4C98
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 14:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167D5C433C7;
	Mon, 17 Jul 2023 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689602837;
	bh=TjaOIkKfDPOZsfcumT3Gnw7mkCGRWXT5jNB5RAlBicE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=dxc/oCtmKqKNX8OjI+dRQ9W1xO3gUZzpRSVkhYqH4GqtpuKAP4mQNs+E3sg1wM77H
	 1fe3aQX2H6xNghdKbvAhdTkaVIuInrrPXuXc4GK9Iu7tkYC11t6AWWnR0PFdwqAtkT
	 YMwk3NVCk1peLapNcAr+q7TqvyFv0mm4tpaT9UTsmFQjxCNSLsYffMcsz2OBR+jVl3
	 UQlTA/e4dorV0bKm7EFi51w260dTt9A+gRoi0rscaEkfeyt0sYJVzTCz69t3uEz/xm
	 ULj9AG5ou4opJrWT/diOCiS5KSMb++oAa98cNnQtRMIJrcip1JpOj145Sotdiqhjs3
	 OpFUdzqXK6S0g==
Message-ID: <37848a79d953888ab2a73183b0271d18.mripard@kernel.org>
Date: Mon, 17 Jul 2023 14:07:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v4 01/11] clk: sunxi-ng: nkm: Use correct parameter name
 for parent HW
In-Reply-To: <20230717-pll-mipi_set_rate_parent-v4-1-04acf1d39765@oltmanns.dev>
References: <20230717-pll-mipi_set_rate_parent-v4-1-04acf1d39765@oltmanns.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Roman Beranek" <me@crly.cz>, "Samuel
 Holland" <samuel@sholland.org>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Mon, 17 Jul 2023 15:34:25 +0200, Frank Oltmanns wrote:
> ccu_nkm_round_rate() takes a clk_hw as parameter "hw". Since "hw" is the
> nkm clock's parent clk_hw, not the clk_hw of the nkm clock itself,
> change the parameter name to "parent_hw" to make it more clear what
> we're dealing with.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

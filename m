Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E346311CBA
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Jul 2023 11:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA656C433C8;
	Fri, 28 Jul 2023 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690543188;
	bh=A+kMGP5XBUEK/js9vxBBi+9xCO8IUT5dAfe86qUVntM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iYQtTVQCCNaBv1nTH9V1Qy1DMjl8v0mnrfeidxVDT7X91ewgVRIeI/SRqcpx26/Df
	 rnJBkqrNku0/+/bRXHvSTr6PpCZNnLdtB2TMRfpla84b1QuDtKTk6nF5NBUEgCT8yI
	 keyyHlm+J/wuworM5Bnslm038rFQYqJp5uSeQ70E3FUmL8zMBwJT0dzO4J2jiiDoJ9
	 MhgBBWKmUwx/jZeNHOLKNKZM4yJhQV/y4jCJ04qBY8NvV9QAXobx0FjKpJwvyKVMaV
	 rZwafc7B0QYbU+vXGwIECm33QO33o7enlf0ZVe6AmHQOZz77VH9HIj65isNwbGtkWM
	 2oKrI9CWX4VSg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20230726033554.174365-1-robh@kernel.org>
References: <20230726033554.174365-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: allwinner: prcm: Simplify
 conditional schemas
Message-Id: <169054318538.349489.13231831699309127969.b4-ty@kernel.org>
Date: Fri, 28 Jul 2023 12:19:45 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Tue, 25 Jul 2023 21:35:54 -0600, Rob Herring wrote:
> There's no need for 'additionalProperties' in the if/then schema as there's
> already 'unevaluatedProperties' in the parent schema. With
> 'additionalProperties' dropped, 'compatible' and 'phandle' don't need
> to be listed in the conditional schemas as 'compatible' is already in
> the main section and 'phandle' will be implicitly added.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: allwinner: prcm: Simplify conditional schemas
      commit: 67b8e8658577b117ea33b83c6c176ecd39caf1ca

--
Lee Jones [李琼斯]


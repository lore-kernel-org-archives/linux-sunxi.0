Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDB17F7
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 16:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94918C433C1;
	Sat, 26 Nov 2022 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669479602;
	bh=KXjgMIIzjeBW/b+BUU54O+6KKHdrQhBefEjGsi6yglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4rmnDeoBOWHs9hWyzS0FSHqTBa3TsMxY8h7MukCYnlphmOgmMQovDRNlPvjO24EQ
	 GeVDLyZMWr+mdU0kfzt99/1uEIQB2Hae0wnNQsb1tXb0EyXbQbFKDkS5Nm2N6zqlE4
	 7iaaL3oqSKVOO7lkUuxVcQJZzgYMQ87O/kkSDOl4OXf5ZNz9XPsWYTUxeVXbsDlA7N
	 +CcLtmXyWQK2rN2C94BCkDXMoQIFlAo4TA9xo0T+sYZUm7t+xevmDyl7BUauTtaiBT
	 FAdM8YRZoLHZiKUxUArKxnLfo5AWPpo8pV2XYKAGJkLpQbU8vTK5B/EyL0pEH+WIzq
	 ESYOzFjD1WrYA==
Date: Sat, 26 Nov 2022 16:19:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 06/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Message-ID: <Y4I8q2dMxnnPdCbl@spud>
References: <20221125234656.47306-1-samuel@sholland.org>
 <20221125234656.47306-7-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125234656.47306-7-samuel@sholland.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

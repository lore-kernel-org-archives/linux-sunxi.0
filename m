Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444813AE3;
	Wed,  4 Oct 2023 12:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73F4C433C7;
	Wed,  4 Oct 2023 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696422338;
	bh=rz8nsBRJGgdImTfTRQ7iHKEAJLSF4eOEhtWc3FE31aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFisLVHo4xPOWe0fhwbNCUkMQeehaqaQXzmq2gwElyLHbB+hlPM+w9q/A0UhGISeJ
	 XLwrKX8yClJIjpyp/MgG2+FzVp4HbGidJDj27Qhk6bHe9ekNtsmcOdr694CD8OVgQB
	 h9QT4RlLtaSjpNEEEpGynpT+4dB2V0FBd6wa1j06w0CzJdCNXlxt828HbuYFsaiAf9
	 EnSNtXjnPRJzG1NhD28ZBLk4yaP6fqQ8O90x0kok38bopHI6fclkb2kLzmFXGrug71
	 dDoSSsGPefEsebjfIQQMnU4FvUWAeBm37gqRnq+BYBGmk+Y82OopJUFOFfsOQheNJD
	 /GW2ghyf2ITqQ==
Date: Wed, 4 Oct 2023 20:13:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <ZR1W6lI3O6Pkjxm3@xhacker>
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-8-conor@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230922081351.30239-8-conor@kernel.org>

On Fri, Sep 22, 2023 at 09:13:51AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the th1520 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index ce708183b6f6..723f65487246 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -20,6 +20,9 @@ c910_0: cpu@0 {
>  			compatible = "thead,c910", "riscv";
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <0>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -41,6 +44,9 @@ c910_1: cpu@1 {
>  			compatible = "thead,c910", "riscv";
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <1>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -62,6 +68,9 @@ c910_2: cpu@2 {
>  			compatible = "thead,c910", "riscv";
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <2>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -83,6 +92,9 @@ c910_3: cpu@3 {
>  			compatible = "thead,c910", "riscv";
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <3>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> -- 
> 2.41.0
> 

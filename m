Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476147EC
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Nov 2022 11:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5F2C433D6;
	Sun, 20 Nov 2022 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668943421;
	bh=8PFD1joXMpo0BIBLMMAMUhQ88Ub256i63VmGt7znFMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ak+99zcWQngP8/4sLvjEZHL5BhaaEgvSTPNGIGUEDpu2IcblbH1Kv0wbbnBxjsdE/
	 ZHMz221O0gTOFI6DOAq/VDmJsSvUUKHp+yjNQyIfQfpG/HO1YQP7HY+GfypE8fcY8M
	 AM+3Vq6c0mMnepP19/8QGnFtA49OFhKK23DIEcKnIIsilP0/a4NaTlGPnOPa5zhq3n
	 0FAe7zjy2LI9SQ05TyycfnGqJ9Fm5fIvDeIjSwS6TDn2hZ31sA3je35olQq7ijzVml
	 sFWL2BhgiUlQNcFdr6GrZgjHHG+ztei+++hm57Iw8Gzsf7g9MKMjB9DbVgVELDxOVu
	 7coGSy0dMEq4g==
Date: Sun, 20 Nov 2022 11:23:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 02/12] dt-bindings: riscv: Add T-HEAD C906 and C910
 compatibles
Message-ID: <Y3oOOOdG4e24ByEc@spud>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-3-samuel@sholland.org>
 <76d9c4fb368dca87c64494b927706d0b18d712d2.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76d9c4fb368dca87c64494b927706d0b18d712d2.camel@icenowy.me>

On Fri, Nov 04, 2022 at 10:57:58AM +0800, Icenowy Zheng wrote:
> 在 2022-08-15星期一的 00:08 -0500，Samuel Holland写道：
> > The C906 and C910 are RISC-V CPU cores from T-HEAD Semiconductor.
> > Notably, the C906 core is used in the Allwinner D1 SoC.
> 
> Could this get applied first?
> 
> C906 and C910 now have a fixed-configuration open-source version, which
> means these cores could be played by anyone, and having them in the DT
> binding really helps people. In addition I am aware of some C906-
> equipped SoC out of Allwinner.

I've applied this one patch as v6.2 material since I doubt this series is
gonna make it & the Bouffalolabs dt is going to need this compatible too.
I applied it on top of v6.1-rc1 just in case:

https://git.kernel.org/conor/c/0d814000ad3589bf4f69c9cb25a3b77bbd55ffec

> 
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> > 
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index 873dd12f6e89..ce2161d9115a 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -38,6 +38,8 @@ properties:
> >                - sifive,u5
> >                - sifive,u7
> >                - canaan,k210
> > +              - thead,c906
> > +              - thead,c910
> >            - const: riscv
> >        - items:
> >            - enum:
> 

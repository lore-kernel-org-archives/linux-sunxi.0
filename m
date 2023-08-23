Received: from out-54.mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE415BC
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 03:17:22 +0000 (UTC)
Date: Wed, 23 Aug 2023 13:16:57 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1692760640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zahP6Lk7k9gO6ZWwdWZ4JSMtgXLMnFQ0XU2AxSSHQqk=;
	b=g10hba/RCjfZrCJZ6kvJA5qG83PfMboSMVC5DMuz1BkYsaHcEDYRQapCyCo3w7aQ428a2B
	TQaxZ2edx7VaWhoF9KHaKWzAfcAPwe0tjp9RQLB78Ta5Z4uc4fgzYEcoIzSLmZF6GgBew1
	+WnlAOaB9pEiwPCuDLbs8nHzTpj2y7kFxZX9DJFLwX1N77WqMqKPKME2H7ULtZrQHDqlaR
	1R15js3rAHYtZUgrB8CeaiNfV6QKyKZz8KVLwRFzJwLXoopsHTDIZXqY7o6lgeyb9DIi2t
	ekTP/JoNwBT8UamdiFVRN+drkQLekCyjlUoc+d92oR6WlLPKEfIcr9EROYyhvQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] can: sun4i_can: Add support for the Allwinner D1
Message-ID: <ZOV6KclYNYVmbr6Y@titan>
References: <20230721221552.1973203-2-contact@jookia.org>
 <20230721221552.1973203-6-contact@jookia.org>
 <CAMuHMdV2m54UAH0X2dG7stEg=grFihrdsz4+o7=_DpBMhjTbkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV2m54UAH0X2dG7stEg=grFihrdsz4+o7=_DpBMhjTbkw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Aug 22, 2023 at 02:30:16PM +0200, Geert Uytterhoeven wrote:
> Hi John,
> 
> This makes this question pop up when configuring a kernel for any RISC-V
> platform, not just for Allwinner RISC-V platforms.

Oh dear.

> In comparison, drivers/clk/sunxi-ng/Kconfig does have some
> 
>     depends on MACH_SUN<foo>I || RISCV || COMPILE_TEST
> 
> but these are gated by ARCH_SUNXI at the top of the file.

Ah, that is what I copied.

> I'm not sure what's the best way to fix this:
>   - Replace RISCV by ARCH_SUNXI?
>     This would expose it on more ARM sun<foo>i platforms, making the
>     MACH_SUN4I || MACH_SUN7I superfluous?
>   - Replace RISCV by RISCV && ARCH_SUNXI?

I'm not sure what the best approach here is. Just having it require ARCH_SUNXI
would make sense to me but I'm not too sure why where's so many different MACH
here in the first place.

> Thanks for your comments!
> 
> >         help
> >           Say Y here if you want to use CAN controller found on Allwinner
> > -         A10/A20 SoCs.
> > +         A10/A20/D1 SoCs.
> >
> >           To compile this driver as a module, choose M here: the module will
> >           be called sun4i_can.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

John.

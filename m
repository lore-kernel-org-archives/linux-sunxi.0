Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C3042A8B
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Jun 2025 01:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382959; cv=none; b=IS9tPD3USv6h8mq8MBE0Tvb3FOGEGIfn8Caa4wf9cpf34NeC48jHTRQGq7mJ6/ZbjDOcjUq1fUi1iEWZel4D5DJ4wswxKt4TOcBfJnrEBySAs1qtdKEn709fJl06KCHIfI46zju4PsUHuY00QZxq9SVttVE3C/ld+bbVgxDtSCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382959; c=relaxed/simple;
	bh=0gmfdf4OAtz954mnULUTEX2hkGqUAO+fPptmUl1h4wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8W1ajsFBi231ZFmrgUpr6OtxUFe8nZcDmGreSboJ58NunP6AQ6zuFzrzMyZhADRNJTUlPPN1z1zdeVPZOJigTmcktnLmaJFnixMVFmuqoNyl2I7+cD03N1Ar6vbsxtOp7gSQRFDZMcf0VjTqJaL3UWzJwl9meW2g3IBoBCTXjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80045113E;
	Thu, 19 Jun 2025 18:28:57 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7620F3F673;
	Thu, 19 Jun 2025 18:29:15 -0700 (PDT)
Date: Fri, 20 Jun 2025 02:28:03 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing
 PPU0 reset
Message-ID: <20250620022803.13e7c34c@minigeek.lan>
In-Reply-To: <20250619171025.3359384-2-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
	<20250619171025.3359384-2-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 01:10:24 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.

Confirmed by experiment.

> Add a reset entry for it at the end of the existing ones.
> 
> Fixes: 52dbf84857f0 ("dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  include/dt-bindings/reset/sun55i-a523-r-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/reset/sun55i-a523-r-ccu.h b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
> index dd6fbb372e19..eb31ae9958d6 100644
> --- a/include/dt-bindings/reset/sun55i-a523-r-ccu.h
> +++ b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
> @@ -21,5 +21,6 @@
>  #define RST_BUS_R_IR_RX		12
>  #define RST_BUS_R_RTC		13
>  #define RST_BUS_R_CPUCFG	14
> +#define RST_BUS_R_PPU0		15
>  
>  #endif /* _DT_BINDINGS_RST_SUN55I_A523_R_CCU_H_ */


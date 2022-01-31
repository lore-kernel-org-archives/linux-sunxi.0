Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980512C9E
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 10:19:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 588C3D6E;
	Mon, 31 Jan 2022 02:19:45 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 482403F774;
	Mon, 31 Jan 2022 02:19:44 -0800 (PST)
Date: Mon, 31 Jan 2022 10:17:49 +0000
From: Andre Przywara <andre.przywara@foss.arm.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-sunxi@lists.linux.dev, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] ARM: dts: suniv: Enable mmc for f1c100s.
Message-ID: <20220131101749.5a6d743c@donnerap.cambridge.arm.com>
In-Reply-To: <20220130220325.1983918-4-Mr.Bossman075@gmail.com>
References: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
	<20220130220325.1983918-4-Mr.Bossman075@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Jan 2022 17:03:25 -0500
Jesse Taube <mr.bossman075@gmail.com> wrote:

> Enable mmc0 in f1c100s-licheepi-nano device tree.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
> * New patch
> ---
>  arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
> index a1154e6c7cb5..c856a6a20dc8 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
> +++ b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
> @@ -24,3 +24,9 @@ &uart0 {
>  	pinctrl-0 = <&uart0_pe_pins>;
>  	status = "okay";
>  };
> +
> +&mmc0 {
> +	bus-width = <4>;
> +	broken-cd;
> +	status = "okay";

Do we need a vmmc-supply?
Otherwise looks alright.

Cheers,
Andre

> +};


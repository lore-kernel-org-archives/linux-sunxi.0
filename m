Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B0B7C
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 10:43:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FAA1FB;
	Tue,  8 Mar 2022 02:43:02 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F25BE3FA45;
	Tue,  8 Mar 2022 02:43:00 -0800 (PST)
Date: Tue, 8 Mar 2022 10:42:58 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, George Hilliard
 <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 05/14] ARM: dts: suniv: F1C100: fix CPU node
Message-ID: <20220308104258.67d09e25@donnerap.cambridge.arm.com>
In-Reply-To: <526e09f8-6006-643a-70c6-d9b85e6cdb75@gmail.com>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
	<20220307143421.1106209-6-andre.przywara@arm.com>
	<526e09f8-6006-643a-70c6-d9b85e6cdb75@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Mar 2022 21:44:15 -0500
Jesse Taube <mr.bossman075@gmail.com> wrote:

Hi,

> On 3/7/22 09:34, Andre Przywara wrote:
> > The /cpu node in the f1c100s.dtsi is not spec compliant, it's missing
> > the reg property, and the corresponding address and size cells
> > properties.
> > 
> > Add them to make the bindings check pass.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >   arch/arm/boot/dts/suniv-f1c100s.dtsi | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > index 922efd5e9457..43d342eaf661 100644
> > --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > @@ -29,9 +29,13 @@ osc32k: clk-32k {
> >   	};
> >   
> >   	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> >   		cpu {  
> cpu@0

Right, thanks for spotting this. Wondering why make dtbs and make
dtbs_check didn't warn.

> also is memory node required?

As Icenowy said, it's added by U-Boot anyway, filled with the actual
amount of memory. This means you can have a F1C200s instead and it will
work automatically.

Cheers,
Andre

> 
> Thanks,
> jesse
> >   			compatible = "arm,arm926ej-s";
> >   			device_type = "cpu";
> > +			reg = <0x0>;
> >   		};
> >   	};
> >     
> 


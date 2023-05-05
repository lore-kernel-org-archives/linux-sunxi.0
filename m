Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E30FDF71
	for <linux-sunxi@lists.linux.dev>; Fri,  5 May 2023 21:46:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2FF1FB;
	Fri,  5 May 2023 14:47:17 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42D1D3F64C;
	Fri,  5 May 2023 14:46:30 -0700 (PDT)
Date: Fri, 5 May 2023 22:46:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: robh+dt@kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Icenowy Zheng
 <uwu@icenowy.me>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
Message-ID: <20230505224611.00c281f6@slackpad.lan>
In-Reply-To: <CALHCpMiwqkMRV2Nv0sKG8ZD2D6jbjVaB6_jcShf6hMBUP3D3Dg@mail.gmail.com>
References: <20230505074701.1030980-1-bigunclemax@gmail.com>
	<20230505105805.548d1a1b@donnerap.cambridge.arm.com>
	<CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
	<20230505170015.664c18bc@donnerap.cambridge.arm.com>
	<CALHCpMiwqkMRV2Nv0sKG8ZD2D6jbjVaB6_jcShf6hMBUP3D3Dg@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 6 May 2023 01:25:02 +0400
Maxim Kiselev <bigunclemax@gmail.com> wrote:

Hi Maxim,

> > Can you please try these patches, and use:
> > compatible = "allwinner,sun20i-d1-spi", "allwinner,sun50i-r329-spi";
> > for the compatible string?  
> 
> I tested my patch (with compatible prop changed to
> allwinner,sun50i-r329-spi) on top of these patches and it works fine
> for me.
> 
> > If possible, you could revive this series, and add the D1/T113s support on
> > top: just add the compatible string combo to the binding document.  
> 
> Just one question. Should I do it now, or is it better to wait while
> Icenowy Zheng finishes work on the next revision of this series?

This series is over a year old, I doubt she will jump on this again any
time soon. So it would be great if you could rebase the patches, keeping
her authorship and Signed-off-by:, adding your Signed-off-by: and
posting them.
I might take a deep breath and try to solder some NOR SPI on my MQ-R to
test it later on....

Many thanks!
Andre

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D2F1170E
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 14:36:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62DEDD75;
	Mon, 11 Sep 2023 07:36:59 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0B323F738;
	Mon, 11 Sep 2023 07:36:19 -0700 (PDT)
Date: Mon, 11 Sep 2023 15:36:17 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, airlied@gmail.com, conor+dt@kernel.org,
 daniel@ffwll.ch, heiko@sntech.de, jagan@edgeble.ai,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 mripard@kernel.org, neil.armstrong@linaro.org, noralf@tronnes.org,
 robh+dt@kernel.org, sam@ravnborg.org, samuel@sholland.org, uwu@icenowy.me,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 8/8] ARM: dts: sunxi: add support for Anbernic
 RG-Nano
Message-ID: <20230911153617.530ac42b@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v66qXS1Yn8fCd9kbgf9mrbpa8A4q=px+0jAX5Z567oYAsg@mail.gmail.com>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
	<20230828181941.1609894-9-macroalpha82@gmail.com>
	<20230911004909.6a40e1c0@slackpad.lan>
	<CAGb2v66qXS1Yn8fCd9kbgf9mrbpa8A4q=px+0jAX5Z567oYAsg@mail.gmail.com>
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

On Mon, 11 Sep 2023 21:35:19 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi Chen-Yu,

[...]

> > Regarding multiple RTCs: I didn't find anything which assigns a
> > priority level to multiple RTCs in the system. What you can do on the
> > userland side is to have a udev rule that links the PCF device to
> > /dev/rtc, so that most tools would use that as a time source.  
> 
> You can add DT aliases to override the numbering, thus making an external
> one rtc0 and the internal one rtc1. See
> arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts for such an example.

Ah, excellent, I somehow missed this. That should indeed solve that
problem.

Thanks for the heads up!
Andre

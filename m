Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955E2F27
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Feb 2022 17:16:29 +0000 (UTC)
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N1u2b-1mDg5i3Gyv-012EL9 for <linux-sunxi@lists.linux.dev>; Wed, 02 Feb 2022
 18:16:28 +0100
Received: by mail-yb1-f172.google.com with SMTP id r65so569871ybc.11
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Feb 2022 09:16:27 -0800 (PST)
X-Gm-Message-State: AOAM530eu0ncnoQraMa1+i61GtoYIygPQoSRiAynx/UEKO0HrTmbwUvs
	klU5gHE81qcUNvpbt/1Smzw4oqQHlrNPYMGUxHo=
X-Google-Smtp-Source: ABdhPJz2O/9Dqb43FQaFEs2fgdQ11r4WChyB6XAjTgMFNwZoBX1IgqEBVLSxxOha4gVbBN3Qpzy/vvWlFqfDO4Fo+i8=
X-Received: by 2002:a05:6830:33c2:: with SMTP id q2mr16651474ott.368.1643815893880;
 Wed, 02 Feb 2022 07:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <30ed8220-e24d-4b40-c7a6-4b09c84f9a1f@gmail.com>
 <20220131121027.4fe3e8dc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <7dc930c6-4ffc-0dd0-8385-d7956e7d16ff@gmail.com> <20220131151315.4ec5f2d3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <dd1497ca-b1da-311a-e5fc-7c7265eb3ddf@gmail.com> <20220202044603.tuchbk72iujdyxi4@sx1>
 <20220201205818.2f28cfe5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20220202051609.h55eto4rdbfhw5t7@sx1> <8566b1e3-2c99-1e63-5606-aad8525a5378@csgroup.eu>
 <20220202064950.qyomo7ns27mbedds@sx1> <20220202151707.GA2365@hoboy.vegasvil.org>
In-Reply-To: <20220202151707.GA2365@hoboy.vegasvil.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Feb 2022 16:31:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ZGFBmxUWm5-DT_QfvU0k8HViEbV4zhwwC8FJLMKZTYg@mail.gmail.com>
Message-ID: <CAK8P3a3ZGFBmxUWm5-DT_QfvU0k8HViEbV4zhwwC8FJLMKZTYg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: kbuild: Don't default net vendor configs to y
To: Richard Cochran <richardcochran@gmail.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Hemminger <stephen@networkplumber.org>, 
	Saeed Mahameed <saeed@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Mark Einon <mark.einon@gmail.com>, Lino Sanfilippo <LinoSanfilippo@gmx.de>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Chris Snook <chris.snook@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Jeroen de Borst <jeroendb@google.com>, Catherine Sullivan <csully@google.com>, 
	David Awogbemila <awogbemila@google.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Jon Mason <jdmason@kudzu.us>, 
	Simon Horman <simon.horman@corigine.com>, Rain River <rain.1986.08.12@gmail.com>, 
	Zhu Yanjun <zyjzyj2000@gmail.com>, Shannon Nelson <snelson@pensando.io>, 
	"drivers@pensando.io" <drivers@pensando.io>, Sergey Shtylyov <s.shtylyov@omp.ru>, Jiri Pirko <jiri@resnulli.us>, 
	Edward Cree <ecree.xilinx@gmail.com>, Martin Habets <habetsm.xilinx@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <Jose.Abreu@synopsys.com>, Andy Gospodarek <andy@greyhouse.net>, 
	Michal Simek <michal.simek@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, 
	Jacob Keller <jacob.e.keller@intel.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Rob Herring <robh@kernel.org>, "l.stelmach@samsung.com" <l.stelmach@samsung.com>, 
	"rafal@milecki.pl" <rafal@milecki.pl>, Edwin Peer <edwin.peer@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Chan <michael.chan@broadcom.com>, 
	Gerhard Engleder <gerhard@engleder-embedded.com>, Marcin Wojtas <mw@semihalf.com>, 
	Oleksij Rempel <linux@rempel-privat.de>, Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Slark Xiao <slark_xiao@163.com>, Liming Sun <limings@nvidia.com>, 
	David Thompson <davthompson@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Prabhakar Kushwaha <pkushwaha@marvell.com>, 
	Omkar Kulkarni <okulkarni@marvell.com>, Shai Malin <smalin@marvell.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Gary Guo <gary@garyguo.net>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"oss-drivers@corigine.com" <oss-drivers@corigine.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:oJnXtmoSznOCx5rUmhQISSP7uBSPtLQ5B3hil/+AUW92WmSGO//
 vUHwLewCguWAizcQtbbDLxYVyd944n0frOmnVe4s5vaHU+CtsbueWWz5VLNFrFIzNR/UbLM
 oN+laGT3VTONn6ZmVZAmntn+k66T+8qUA/ZJAV0dQ4c/FGcHR6cL4lcUfcLbaYEvBTFvzNl
 DIbK8dJvTQ94x2bh361yA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IdBrbc4vmHU=:cPooABSM+m9+5/VW0Bxm/o
 pjwm9mGdVXBJ2o8ihCUB4dUFR7m47xDuQwzWLsh/Px0EZUp7OJUbKWKjrY9lE5VcsYjBve08G
 hcUNCEr91KJSmkzI27hBnj7i2LAw/U0wITFYbFx008vCK7zWANocmIXWGXRwGyCHh+41VNZl+
 Uo7+ZxP/adRLBFxQcVq6UJJZjDJEo1N7QBWM7RB2cP1pWWsow7kiy8WNxNix9+GV02N84iECH
 DZaiZx4kzfQi6soxK44YCmpHVE2FyYsjXe5iza12iQEO9+tFDs7rBRhPDGe3tkyJ2NFDxF79y
 rIzBLOo12vWSoZthuULutKypAga8g/KkLjwMjUH+Vr8I3QyNiAfvhRHDfW12GFGaikpIHFPch
 mJjlJ/49UMYLmE/GRLAMQ7K+Ujj2I3xD/4XabKgwEmcODzHurG22Ah+UnFoqiIptKTueql3g1
 BFBzMLZp7DrK1VOipFiAB7gMaTX7UjuvUF3beNer3mk1vqj5AXTK9+UlVFWgzT2en0Xni09MM
 8HR7QcCfkpMYqJVCYIgRm/WG0hFpr64z9tEfWgPVu9GiX5POpfJ1Y0v7eZLn09bZ8z5pRvAiV
 pJpZnMGCKx4+IeMSooKNinfiO4ijtGVgEsbyRTwkCjE+DtwDlnkHRZnAzgYZgI4gVKUL1gChm
 9lqnx71HYy7YQd8SjXwItwVK5pnB/4M5q8owAjISJ7JYEUIcKHdX6q0Fwatu1CMQ4RKvihF9I
 ax3Ai2RqVzjbvau5Gg9RlfkVUlRgJVt/aaO7hEbuXcroZaxj7vgH2qLm3/DqSb64C+jK6AoRp
 QUywlWoIzowmSNDA4T4du23WoX57eiMe2zenAIS2HTMptSuSrg=

On Wed, Feb 2, 2022 at 4:17 PM Richard Cochran <richardcochran@gmail.com> wrote:
>
> On Tue, Feb 01, 2022 at 10:49:50PM -0800, Saeed Mahameed wrote:
> > I can't think of a clever easily verifiable way to map boards to their VENDORS.
> > Add to that dispersing the VENDORS configs accurately.
>
> Just an idea...
>
> 1. make foo_defconfig
> 2. for each vendor, do scripts/config --disable vendor
> 3. make savedefconfig
> 4. compare defconfig with foo_defconfig
>    difference means some MAC was removed

This needs an extra 'savedefconfig' step in the beginning, as a lot of
the defconfig
files are already different from what you get after savedefconfig, both in the
order of options, and in options that got renamed or removed over time.

         Arnd

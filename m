Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E127E
	for <linux-sunxi@lists.linux.dev>; Tue,  2 May 2023 08:07:01 +0000 (UTC)
Received: from [192.168.4.220] ([91.47.48.20]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MbRXj-1qVIpj1Rk1-00bwHO; Tue, 02 May 2023 10:06:22 +0200
Message-ID: <10a2e893-18b6-d9c2-1db7-3d500cc0891c@in-circuit.de>
Date: Tue, 2 May 2023 10:06:20 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 0/2] arm: dts: sunxi: Add ICnova A20 ADB4006 board
 support
Content-Language: de-DE
From: Ludwig Kormann <ludwig.kormann@in-circuit.de>
To: samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230420102409.1394618-1-ludwig.kormann@in-circuit.de>
Organization: In-Circuit GmbH
In-Reply-To: <20230420102409.1394618-1-ludwig.kormann@in-circuit.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:BZP4xb+RWZ7PqlXjFE/uNSiirW28Q+PM1TXFqzYbS0oaUj9wJdZ
 jD0KwhUB+YexK2scZoHXG2GKeFXakH38VefYWHKtbp0SX1PEcHbzI0nY1nDNLRK4DWMM4oo
 P+x+Uj0ZACMSLSpKCVbThkexaRsCT/aO0+eQVhGJRSvlYj2Le+Miv4AvVZUhdIQIkG7IRdE
 xIUiBQyyaQ9joF/dW8S+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nVYx4BwtwhY=;WMDNxxFCvp2lY1QgJs1UXYHnuNg
 HH1q3tMogLKLhGb25oYOGjvhjOlihk9I0X3SAJYff4/NeigfbNQGYqge9ecZ1YUFp2FrXldJb
 tKE3Fu4Qx8908qnDwUQZvrCB1N8Vq3MreBR7fswXnaj8mF6VgFAAeOqMhWpBc/QcY11HmbApW
 Nqx8hkSbJVcHLZ2vG79wj7ZgpkKuIL1PM/QHxEnFbnxSJLbn22oOX/U6H1QXcfD8iTCFMNQGR
 PHNWX6QB1SrGjn86LnEHbtS7vykSbNU5OVYqfa3fJlVxxZX+Qd0Obe6uhY0G1AUIgVL71hfgI
 mE6jHf3+SCG/ht3FRN2+iatfC5U6GMCjYA9pnZkzLmMPlGMpdFM9cF2Yen1FjeKe9GrXovMwW
 MDgOuzaTJO5LQpcGh2S0EC6E6caUIJkUGgZqmKyfh55DWanTfjRzg8dJMuINSWgRLQF0TFnWK
 uUEusMNAdGF/Tcf1Wq8a+rXIReRxgkEmuOWDp//+VtaccSH+5z16J6KUH6klCGMeVf5SgXC7k
 u5ouRkoR+50CU/w0vndEWIuOR+jDpHdFDcQZHNPMzPHKfFyqyqaFpc5Gctn38WmlzcFYW1gtt
 baywxUo4o/IOoVWaK3EdAZRB7t8setkJlpOTzDJHRZTouiFIe5s7kPdOxpCpeo2ic/BAsIZPy
 dnXpIIW08XUtL1L/RlmKzgMwHfbwzmTLfKd/DtOJvQ==

Hello,

thanks for the reviews so far!

Is there anything I can do / need to do for my patch series for it to 
get merged before -rc1?

The patch series was based on the "for-next" branch in jernej's tree, 
but it seems that it was too late for the "dt-for-6.4" merge.

So I'm just trying to understand in general what the best way in this 
situation would be:
- wait if someone else takes the patch series before -rc1
- wait for -rc1 and rebase, rework, send a new version of the patch 
series (because of the planned restructuring of the ARM dts directory)
- wait for -rc3 (?) and rebase & rework the patch series for jernej's 
tree for the "dt-for-6.5" branch

Thanks for your help.

kind regards
Ludwig Kormann


Am 20.04.23 um 12:24 schrieb Ludwig Kormann:
> Add board support for ICnova A20 SomPi compute module on
> ICnova ADB4006 development board.
>
> v3:
> - drop stray blank lines at end of files
> - separate patch for bindings
> - update licensing to "GPL-2.0 OR MIT"
> - fix typo: ICNova -> ICnova
>
> v2:
> - use short licensing header
> - remove deprecated elements from led nodes
> - disable csi power supply
> - add missing pins in usbphy node
> - split dts into SoM dtsi and carrier board dts
>
> v1 of this patch was sent to the uboot mailing list [1].
>
> [1] https://lists.denx.de/pipermail/u-boot/2023-April/514605.html
>
> Ludwig Kormann (2):
>    dt-bindings: arm: sunxi: add ICnova A20 ADB4006 binding
>    arm: dts: sunxi: Add ICnova A20 ADB4006 board
>
>   .../devicetree/bindings/arm/sunxi.yaml        |   6 +
>   arch/arm/boot/dts/Makefile                    |   1 +
>   .../boot/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 ++++++++++++++++++
>   arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi   |  62 ++++++++
>   4 files changed, 206 insertions(+)
>   create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
>   create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi
>

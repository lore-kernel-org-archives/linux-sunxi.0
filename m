Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689C810F4
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 21:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D87C433C8;
	Mon, 28 Aug 2023 21:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693258443;
	bh=6fcApPvCZss8ExAOclKs9AFG0b+NxjbECMWCbvnj5GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJzMTfupCrzPuObBEVnPV2jIwwEKBlKwTWOj4V8KaaqovTmXB6x6rrQ9irg9rEBd4
	 /9IYOgn47sNcN92jv13adEPHlV5Et/b4/23MjG4HMvvJFfxIMzmDQ8MtpKOMDeZLTd
	 fSwLMP3dzacZ9em0wao5kuOeZsG3ABENo6ngTNYiIFEcIjZn2jmZhk1eMJVxSRPBJ9
	 p7Br5pvDBw/MdH8rCQrTvL38xUtDwIlZzBuJa92q5my2Z/2VZksZugsH+M9XevfMVf
	 Hy9jt98mZMNnkcQDUU3py6/8c0p3IE8KH/JffLszxadFAHMbb8x8Hb9aaJ1QsxDM6Y
	 hBClngb2XDhNA==
Received: (nullmailer pid 383795 invoked by uid 1000);
	Mon, 28 Aug 2023 21:33:59 -0000
Date: Mon, 28 Aug 2023 16:33:59 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: robh+dt@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org, Chris Morgan <macromorgan@hotmail.com>, mripard@kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, noralf@tronnes.org, jernej.skrabec@gmail.com, jagan@edgeble.ai, uwu@icenowy.me, airlied@gmail.com, andre.przywara@arm.com, samuel@sholland.org, devicetree@vger.kernel.org, sam@ravnborg.org, daniel@ffwll.ch, heiko@sntech.de
Subject: Re: [PATCH V4 2/8] dt-bindings: display: panel: mipi-dbi-spi: add
 Saef  SF-TC154B
Message-ID: <169325843883.383742.8355219779786570661.robh@kernel.org>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
 <20230828181941.1609894-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230828181941.1609894-3-macroalpha82@gmail.com>


On Mon, 28 Aug 2023 13:19:35 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Saef SF-TC154B is a 1.54 inch 240x240 square panel with a MIPI DBI
> compatible interface. The panel is used on the Anbernic RG-Nano
> handheld gaming device.
> 
> The initialization of the panel requires a firmware binary which can
> be made with the mipi-dbi-cmd[1] tool. The command sequence needed
> can be found in both source[2] and binary form[3].
> 
> [1]: https://github.com/notro/panel-mipi-dbi
> [2]: https://github.com/macromorgan/panel-mipi-dbi-firmware/raw/main/saef%2Csftc154b.txt
> [3]: https://github.com/macromorgan/panel-mipi-dbi-firmware/raw/main/saef%2Csftc154b.bin
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


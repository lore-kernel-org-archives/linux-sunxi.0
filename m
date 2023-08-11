Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264E63B6
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Aug 2023 15:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AACAC433C8;
	Fri, 11 Aug 2023 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691767397;
	bh=Ho1BktKQry1AwZyk/Ld1JPf/6FoMBAMsShd58BTrNlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVBghkm3FHPG5Dgi7xPj5oiBZy10jMZCVSWPzxepGH5oGgD5CI6TKwVI3GmKqRmvf
	 0jzxjyG86cvwq4H5NmQ980iHTMwX6InwM5hUIYQDYJ3otzpwhyT9z/40/MYG9JW8T7
	 CqyApFfDatLO+aX2PXNJLwZriAANUThq71KZex+mN3R+UDc+5vTjLEoIzgijLLbo+q
	 3P0gS1tmH40C0XyFr0nGjngIoOcFvYUz6MLgTZx1ON4Cb5OHawplAbh3035tLjjOuf
	 Az9rFgHUDBAUoaCLLcveUKz75BAknEt1bE43oUl3rrrIXDmaUY/uOWChyZ/gQQC6eC
	 PZdYf1PZtOtNw==
Date: Fri, 11 Aug 2023 16:23:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Martin Botka <martin.botka@somainline.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: SID: Add binding for H616 SID
 controller
Message-ID: <20230811-slighted-myspace-2088c599a53b@spud>
References: <20230811-sid-h616-v1-0-d1dfc9f47b19@somainline.org>
 <20230811-sid-h616-v1-1-d1dfc9f47b19@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="skCicSOVDML5Sf8Z"
Content-Disposition: inline
In-Reply-To: <20230811-sid-h616-v1-1-d1dfc9f47b19@somainline.org>


--skCicSOVDML5Sf8Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 01:02:34PM +0200, Martin Botka wrote:
> Add binding for the SID controller found in H616 SoC
>=20
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-=
sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.=
yaml
> index 296001e7f498..2ec0a1b8f803 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> @@ -27,6 +27,7 @@ properties:
>            - const: allwinner,sun50i-a64-sid
>        - const: allwinner,sun50i-h5-sid
>        - const: allwinner,sun50i-h6-sid
> +      - const: allwinner,sun50i-h616-sid

As said by Andre, use a fallback compatible here please.

--skCicSOVDML5Sf8Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNZSXwAKCRB4tDGHoIJi
0kBCAP9zXkJ4jN0+tQ7P1THKt+PtDQXtC47DGTP/gGOWjeNXjgD/b/NbHCPvvTJB
vCrrdNEoyjUoxosmfi7845LpJGT/ygI=
=BWTm
-----END PGP SIGNATURE-----

--skCicSOVDML5Sf8Z--

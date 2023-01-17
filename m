Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6977A256A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 13:15:22 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id d66so19679052vsd.9
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 05:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19pXK4MYcm7aEBv7zhE31AeKvxiGLtTj9nKwZ+IpypA=;
        b=EjPmlRKGfPnKWdQVauhnupawv9WU2ujfl5QACheTjB6Jfl45+Ic/QItNypUS0BEsaa
         h5mlpkEKLrha+2/LwkmzoRF17ppQMNxBmEfouZDrMLDqSDthJ222tp/VMjD8zhgdjfgb
         1+6xqmpr1Eutk9CFHmCCdkIiMvG09unimlNEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19pXK4MYcm7aEBv7zhE31AeKvxiGLtTj9nKwZ+IpypA=;
        b=Ta9DT3K2XmcC4ugnwyVzGRaJ677IwgZLI4cwf6wy3MpgrEgLu43WRV5ic9o/p9ZFAW
         903swrWcOtlW/IhB8Fg+as4511MXkiKXS4VmjW1LQy51LesYW8gCAMQd+Xsa49OV2p+N
         f7b45t+DwKHBRcsZP3OjDkx40msn1qCl4312JLp8FuhLqOugcmM9SxggRxiDVxcPfO5p
         kAsv2j2fXbXQRsDLVOUfsgytVOUfZR7CojA8Bh0wjDR76AYfzncMJzoStfH1gQA2z/e0
         Uoa0gBDpRA6FAoQ4r0gxds4nvPFVpYp8cEO5uJD9YQwT/c2a39TQtkMog7wBoLvj/PJ0
         7qfw==
X-Gm-Message-State: AFqh2koIR/oHwcReHdSslIefD3peTP0sN6VoAubon6D3fw4QyVnjfTE8
	kQzPqsw694KN9jBNTO1DUT0qW/1VhXmKeEzzrFU=
X-Google-Smtp-Source: AMrXdXsFvnU6OlaiEYaA06eQ03+Xy2YnAsF14vOqa6sVYBo9QTCaHPNVELjtXBuAsi4bdQh/yBfchg==
X-Received: by 2002:a05:6102:fa6:b0:3d3:e075:5f19 with SMTP id e38-20020a0561020fa600b003d3e0755f19mr2600174vsv.27.1673961321218;
        Tue, 17 Jan 2023 05:15:21 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-3487-94a5-6d7e-19f3.res6.spectrum.com. [2603:6081:7b00:6400:3487:94a5:6d7e:19f3])
        by smtp.gmail.com with ESMTPSA id o5-20020a05620a2a0500b006fcc437c2e8sm20528170qkp.44.2023.01.17.05.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 05:15:20 -0800 (PST)
Date: Tue, 17 Jan 2023 08:15:18 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
Message-ID: <20230117131518.GW3880571@bill-the-cat>
References: <20230117120938.818180-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MOeiELSuYwpLEKvX"
Content-Disposition: inline
In-Reply-To: <20230117120938.818180-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--MOeiELSuYwpLEKvX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 12:09:38PM +0000, Andre Przywara wrote:

> Commit 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to Kconfig")
> moved some NS16550 configuration variables into Kconfig.
> Among those there is CONFIG_SYS_NS16550_REG_SIZE, which used to be only
> defined for SPL build runs, but now is always set (thanks for Kconfig).
> However this breaks the gating logic in ns16550.h, where we *override*
> this variable for DM build, as we learn this setting from the DT instead.
>=20
> As a consequence, we did the register shift twice: once when building
> the register struct (as required for non-DM SPL builds), but then also
> again in the driver after we parsed the reg-shift DT property.
>=20
> Change the logic to match what the comment says: only observe
> CONFIG_SYS_NS16550_REG_SIZE when not using DM, and ignore it otherwise.
>=20
> This fixes U-Boot proper for all sunxi boards, since they are relying
> on this driver being build non-DM for the SPL, but DM for U-Boot proper.
>=20
> Fixes: 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to Kconfig")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>=20
> this is admittedly a quick fix, to get sunxi booting again. This whole
> code around the register access looks somewhat bonkers, to be honest,
> but at the moment I don't have time to rework this.
> Another possible "quicker fix" would be use a separate variable for the
> register shift, so that we don't have to redefine a Kconfig variable.
> Another idea would be to get rid of the struct for the registers
> altogether, to remove the hacks about when to shift.
>=20
> Cheers,
> Andre
>=20
>  include/ns16550.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/ns16550.h b/include/ns16550.h
> index 243226fc3d9..e9e2aeedd16 100644
> --- a/include/ns16550.h
> +++ b/include/ns16550.h
> @@ -26,11 +26,12 @@
> =20
>  #include <linux/types.h>
> =20
> -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_REG_SIZE)
> +#if CONFIG_IS_ENABLED(DM_SERIAL)
>  /*
>   * For driver model we always use one byte per register, and sort out the
>   * differences in the driver
>   */
> +#undef CONFIG_SYS_NS16550_REG_SIZE
>  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
>  #endif

Does:
https://patchwork.ozlabs.org/project/uboot/patch/20230110161946.3816866-5-t=
rini@konsulko.com/
work for you as well?

--=20
Tom

--MOeiELSuYwpLEKvX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPGn2AACgkQFHw5/5Y0
tyxxZAv/btbSpAKq4l2MO5qpTdYQ/GtSx8jwzv/8+nAeBPOfp3IadoTOmZ8cjkSN
4hE47pDQvOaKvBcq9NOgA0Nmbj6l4nEhgspFgiiqMUPAJsJ88G4ZrrMq/r/40Xuu
AYDl8auo6+uz0TGpUUhmQxHsq27U2SAmR+D7TNyywTdw2PJ0j+EEv4so7EHI3SU+
/RflCNfZEgq3RslVGufyj5h2HlbTdxkPw/L8zAsGesiyrexXZ7nS9xZDpS2r+zow
X35qbF4sxLDSv/djCWLzcZ7DBxYxp/819uM27d9Y78L2T0V2lZ4ETD1zi/LEktyu
nB2omembHD6Bd2HMzPSCGQPY7/Cf3im4d4nkx+fe45/mFpopKhw31OJOar0MqPxU
HEifIsqEkubIqf9Cyd+qcZzpboeC23hfwxxQmg5kOaWlyr+JkuOLhuybwVglfrC6
VXOWo+1cZUThrfl8pgdHwaq0auhhFGsnVGuyJjBm/2MISyHZQeksAfkuxkdZ94ZG
pXzJxPpw
=EAaK
-----END PGP SIGNATURE-----

--MOeiELSuYwpLEKvX--

Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1370
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 15:14:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6E5D55C01C4;
	Mon,  7 Jun 2021 11:14:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 07 Jun 2021 11:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=w2Hw4xUfgzOjYV5ZuhT2Zg+R1Bv
	G+1TREXUCNvH3tjU=; b=nGQQXPvsWtO9zxk6VeGwWysqTu7YU330LaNGonKMLTP
	CY1s8ZnexhfMSNm5k9qmjMYtKgV5kDEOp6NdISc+7kiF99aV7EASQmfu4V2gkgws
	H6U014rCKLLgzhzl/RvLMPzpv5KZg6oPHNMSjRaBdSPbTBTCiaxkXRlmKHJyV194
	ioCJ/vL06k+MvTsRozpIc0oid2hjghki0tg505ofVgp1XAw6XeexiJ16f/ME7H7d
	FqJFTvGpmeqMxjr7Akck0ZQ9UtFnHL2yKYLEsujaVpv16dJXxZPOQizKWrF9qAwk
	K+qeIwyIIYaRNW8mxs1rUb6W8TyeMvOnzyfNeuz4big==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=w2Hw4x
	UfgzOjYV5ZuhT2Zg+R1BvG+1TREXUCNvH3tjU=; b=QdZpx+uD/dhKiRpUUwml08
	dZDwoTzVQqIAtov1ylk/qd2mT/DFiISZJlXVvyqLacmfUhEL0aVziyTNKa+icJ85
	6X43FIFN0SXerDDvO7WMOeXv8Pn6dl3aa9tevEg2mjSMm0tdgAgoayZWj/WnFzPa
	yPFumkdqXA4pq6uVU2qVnGm4kz7ohdbaDpqC981/knsZMS0OIfisjb/91vNwPf05
	DBOKFkh8PflwIQptLa/EdpxtiFIAw2DYAaAmeQP4advlqO5FY5MC2BG46c6MPvz6
	Agk+hKEucmlII0pwkIj+o9n1oWy1gEqEtabV+r09s0RLRGzVUzwrfI74GwBr02aQ
	==
X-ME-Sender: <xms:wje-YKfbZ_2Alq4yBcgvWEI5XmsHN4Am-4Io_9Yq7qv5grJXIzhrCA>
    <xme:wje-YEOsesyuE4_JJ07UfNfkqHv9X9Y51_togYB6bfrHULaUEk6Yptu3MUVQahux9
    bckUcsY-SDzqxKwOKc>
X-ME-Received: <xmr:wje-YLjiIyamiR_4H2SsbYhA3bSFZzH9CX8Ijk6NMN3M2gMi6ao4U0Kz28OSj0iSIoyd1NT5uHt2n_5lqlf3j29YaCsw1C3FCEff>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wje-YH9EfFFgexZykUwQDhna_gi1u4nECtjP0ct5HQpTpmfP445L7g>
    <xmx:wje-YGsIy9oqGs-s4FYzZY_izxuOTNBN6I6w2gu0PdsO4raByPuQYw>
    <xmx:wje-YOFTjZ_SmPDrwyDpJ2B5mnMvyT2fk94JBSgFSH6PlrIKDmLOEg>
    <xmx:xze-YEDp8OmNkYgI-EaSiy_bkYzkJ7pTKpmg3PQPcwwqy26OdILarw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 11:14:09 -0400 (EDT)
Date: Mon, 7 Jun 2021 17:14:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
	Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Patrick Delaunay <patrick.delaunay@foss.st.com>,
	Heiko Schocher <hs@denx.de>, Kever Yang <kever.yang@rock-chips.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [RFC PATCH 0/3] fastboot: sunxi: Determine MMC device at runtime
Message-ID: <20210607151407.wjktjyvd37d27nmy@gilmour>
References: <20210524003650.24469-1-andre.przywara@arm.com>
 <f8fa6aca-7525-355f-ec77-26819e4c785d@seco.com>
 <20210524152831.unrg7zexsdbz6uki@gilmour>
 <9f77283d-109a-25ad-d4be-4867ee47d0db@seco.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w5ki47yh52otzu5k"
Content-Disposition: inline
In-Reply-To: <9f77283d-109a-25ad-d4be-4867ee47d0db@seco.com>


--w5ki47yh52otzu5k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 11:43:43AM -0400, Sean Anderson wrote:
>=20
>=20
> On 5/24/21 11:28 AM, Maxime Ripard wrote:
> > On Mon, May 24, 2021 at 10:37:31AM -0400, Sean Anderson wrote:
> >>
> >>
> >> On 5/23/21 8:36 PM, Andre Przywara wrote:
> >>> At the moment the fastboot code relies on the Kconfig variable
> >>> CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for t=
he
> >>> flash command. This value needs to be the *U-Boot device number*, whi=
ch
> >>> is picked by the U-Boot device model at runtime. This makes it quite
> >>> tricky and fragile to fix this variable at compile time, as other DT
> >>> nodes and aliases influence the enumeration process.
> >>>
> >>> To make this process more robust, allow the device number to be picke=
d at
> >>> runtime, which sounds like a better fit to find this device number. P=
atch
> >>> 1/3 introduces a weak function for that purpose.
> >>> Patch 2/3 then implements this function for the Allwinner platform. T=
he
> >>> code follows the idea behind the existing Kconfig defaults: Use the e=
MMC
> >>> device, if that exists, or the SD card otherwise. This patch is actua=
lly
> >>> not sunxi specific, so might be adopted by other platforms as well.
> >>> Patch 3/3 then drops the existing Kconfig defaults for sunxi, to clean
> >>> this up and remove the implicit assumption that the eMMC device is al=
ways
> >>> device 1 (as least for the fastboot code).
> >>>
> >>> I would be curious if others think this is the right way forward.
> >>> The fact that the U-Boot device numbers are determined at runtime
> >>> seems to conflict with the idea of a Kconfig variable in the first pl=
ace,
> >>> hence this series. This brings us one step closer to the end goal of
> >>> removing the "eMMC is device 1" assumption.
> >>
> >> I would actually favor removing CONFIG_FASTBOOT_FLASH_MMC_DEV
> >> altogether, and just specifying the device explicitly in fastboot
> >> commands. If you need to dynamically change the device, you can create
> >> some aliases. E.g. you could have something like
> >>
> >> "fastboot_aliases=3Dsetenv fastboot_partition_alias_user ${mmcdev}.0:0"
> >>
> >> and then run this variable just before calling `fastboot 0` (or whatev=
er
> >> your usb device is).
> >
> > If we're going that way, maybe we can just pass the interface on the
> > command line like dfu does?
>=20
> That could work, but I don't think it's necessary. At the moment there
> are many different ways to specify partitions (KConfig, Aliases, "U-boot
> syntax", GPT partition labels). I would rather pare things down to the
> minimum necessary ways than add yet another bit of state to specify
> partitions.
>=20
> > That way the new requirement would be very obvious instead of
> > introducing a new environment variable no one really expects?
>=20
> I'm not sure what you mean here. This alias system has been in place for
> a while, and it's very convenient for mapping a stable name to some
> arbitrary device and partition.

I don't deny the fact that it can be convenient. What I was pointing out
is that it's been optional the whole time, that I've been using fastboot
for like 5 years and didn't realize that this feature was there, and
it's only implemented for mmc.

To make it required, without any warning, would be fairly confusing.

Maxime

--w5ki47yh52otzu5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL43vwAKCRDj7w1vZxhR
xXWjAP4ijbrP5rFBtxjiISZSUpdorzySkOxN4jszpKafqbpTrwEAtSfHf9ap918v
1/38i3KPC+STnY6v270zr1xs3i85UAM=
=v70t
-----END PGP SIGNATURE-----

--w5ki47yh52otzu5k--

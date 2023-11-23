Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588992E82D
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Nov 2023 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YDhFm98g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700750849; x=1732286849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MUsg89fQ9NBzKyUbXc1Aej1I5ZOvhdvSHAYt6cV/nr8=;
  b=YDhFm98gdKcKRuWqXngUb2P7RcV+XPjpx63qUM+0H4pCdKbLwG1Db4hd
   m+uSCprBntoEN3ET25z4a3a0Unnlsex3h1N07fUrmVDARc2fkd1q2Hsgd
   TCIIzcbefDno2+1pXmegpEPFR+gmfynW/7EGwpi7Wvurl8M+XdkVOrbJm
   juyaE27KHHTiYg94viOeuyxHYhcw4FIU6O7Yf4EmPVFlt4vjee0qBQV+6
   HWqsBkYiO4Uy5KY2wVUEZLEwW+4r+FQuczXu+uKPFnM0lQm90s4pBYNh/
   A4ePztReHKnU4NEcU0X20jVmCMcsamsDcVqWzLAtmfSDRuPziJyUVLSmV
   Q==;
X-CSE-ConnectionGUID: BE0Y80HqR8yoj+GuwVwALQ==
X-CSE-MsgGUID: b3thrMNzRuC8XgsnWxRyVw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="asc'?scan'208";a="12195934"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:47:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:46:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:46:27 -0700
Date: Thu, 23 Nov 2023 14:45:59 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
CC: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
	<alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
	<anup@brainfault.org>, <aou@eecs.berkeley.edu>, <atishp@atishpatra.org>,
	<conor+dt@kernel.org>, <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<dminus@andestech.com>, <evan@rivosinc.com>, <geert+renesas@glider.be>,
	<guoren@kernel.org>, <heiko@sntech.de>, <irogers@google.com>,
	<jernej.skrabec@gmail.com>, <jolsa@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
	<magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
	<n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <peterz@infradead.org>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <rdunlap@infradead.org>,
	<robh+dt@kernel.org>, <samuel@sholland.org>, <sunilvl@ventanamicro.com>,
	<tglx@linutronix.de>, <tim609@andestech.com>, <uwu@icenowy.me>,
	<wens@csie.org>, <will@kernel.org>, <ycliang@andestech.com>,
	<inochiama@outlook.com>
Subject: Re: [PATCH v4 07/13] RISC-V: Move T-Head PMU to CPU feature
 alternative framework
Message-ID: <20231123-snub-headdress-23a80f001ccd@wendy>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-8-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u2td/6ehnVJK/j3z"
Content-Disposition: inline
In-Reply-To: <20231122121235.827122-8-peterlin@andestech.com>

--u2td/6ehnVJK/j3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  drivers/perf/riscv_pmu_sbi.c         | 19 ++++++++++++++-----

> +config THEAD_CUSTOM_PMU
> +	bool "T-Head custom PMU support"
> +	depends on RISCV_ALTERNATIVE && RISCV_PMU_SBI
> +	default y
> +	help
> +	  The T-Head C9xx cores implement a PMU overflow extension very
> +	  similar to the core SSCOFPMF extension.
> +
> +	  This will patch the overflow CSR and handle the non-standard
> +	  behaviour via the regular SBI PMU driver and interface.
> +
> +	  If you don't know what to do here, say "Y".

This is a < 20 line diff to the pmu driver, is it really worth adding
having config options for these two non standard PMU implementations?

--u2td/6ehnVJK/j3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9lpwAKCRB4tDGHoIJi
0p2/AP44N1mho7QcO/007yqDwBgkqYEOvZh2Uuy27l3ZNMV4CwD7BXD0U3yWECON
6d7xv7JjsIfKlCFpYK59CusQR3peRg0=
=tcdb
-----END PGP SIGNATURE-----

--u2td/6ehnVJK/j3z--

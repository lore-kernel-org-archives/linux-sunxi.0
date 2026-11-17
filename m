Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=167.104.49.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955106;
	b=GVF7wS2prMTAn8pb/x8w3nDj5Fd3q+YEqz5FQR31YSXjdFMpygYXuj4sDy7pseKHqN5m
	 aFFD92zz4tJ+IDr207GBRG+BGT56kxG7JLLapLs5bmltVORuLAWK/ez4r1+BvRegJpxD9
	 0yyFOWdp8VYuG8zMUq/3t53sGiUghefRntW4dyFW2D38bteTNo0NxFvfXFO68HRmVZWvb
	 hJHR6VzQdkwA3Jcv1C43WhNmZzPkQmvx4nCEJ+t5xAImsNT2J+c5yCKGFoFba4Bwb5ib1
	 EGFY9mFA52CJiYjtf66FyYtU0IKyx5d8bD62vvZwGqv4VqdeZL0x33mYlp8vwUgft+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955106;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=z18RfqtMGZ649wlBelwVfslMv3Pt9+BQ+uOvhIUd5xs=;
	b=qQbVu1lFxkth+/5EJgXHc4aMV/1K/y5LdWV6EY2wEaY5fdVX6CdSVyo4FfPpvwhEmzjw
	 qSvUjomuB1HoA+cMUcY3fVpElQbGhpbG4fCSrVHDAFpvSnXGfq/AM+lgG7GU9EBcK4RFS
	 rgJFZeHFFISbIaXsqaEEuI05xEugDK/zyoefB+WDC5ZY7ALh5FSyUsJVylu6ccQbwr7Jx
	 ACsE5irtgi4cZVGW4NQvtore+rVV+6ZUHLkwcq9jyeDI6kTWc/+VbAIXdS4WJq8An8xze
	 B9jDNRxc0RoP6PgFfJfdX8GwXQjQpTF9fhywu6ptHdb3hnVNXXr4BU6m5zUKvXtnP9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sverdlin.org;
	spf=pass smtp.mailfrom=sverdlin.org;
	dkim=pass header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=hmtKQ1sr;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=SVLgeoVz;
	arc=none smtp.remote-ip=167.104.49.21
Received: from sendmail-50.purelymail.com (sendmail-50.purelymail.com [167.104.49.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52096606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 22:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52096606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=hmtKQ1sr;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=SVLgeoVz
DKIM-Signature: a=rsa-sha256; b=hmtKQ1srJw73pZSquaKn169Y36okref1QOPTyv5iArUMO68qpkwfzflrpsnJh61w8ZuPaSOgj1fjxBblAJFcCdeXV6Gi+5LoX9ZxlxbTZPlqVxhZ8v/ileqaOoekoeoaj3fu/0vw6CmyWUgzX6reG0zqB0Kv6CU+xJ2rl4DRDYt30dV0bCnDFW22r91sA67+saG1q1p+wH7amjms1tfMcOK4kXDE/TfpUaF4+78zoeTfLgj9PFJXmNigNXObx44paVKm3wz8zMrGMHZkbeSwfFlcqT2Vk0G5wYP0MPcVKGDwK68MwjoYBfzmKguhBIkIgk/BJDMnzsD0bwQQFI3kbQ==; s=purelymail1; d=sverdlin.org; v=1; bh=z18RfqtMGZ649wlBelwVfslMv3Pt9+BQ+uOvhIUd5xs=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=SVLgeoVzKesAEbAGGJWPEsZjqRMp0ztHhuUrYCM4y/+DAakXygec4ub0fJ5vhc4JCqPYzUlmJyvCj3TBm1nElhktfJCczMOQHkrEFzVcOjj/5VdFiWPMD0L1+us7l9Kb25o0Lx6GGlc4dPR9ZC7MhwvKkM4bTdYSPJxcP1DY4PfzDklcegqnheOToi2rN2LhVR2eoysEnO9iLTDSU5hzBmFoBOhOsJf8gOq+go8pU13k8py1IrbkgfUkzwc1EdIVldQGK6yuGOySAjjnm7emlfkQyhzqCJfLVNj7/C7zVpurVyssiPufgCJDUqUf3R0rANPaOJEPZHUPSwnQyzk5TA==; s=purelymail1; d=purelymail.com; v=1; bh=z18RfqtMGZ649wlBelwVfslMv3Pt9+BQ+uOvhIUd5xs=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-sunxi@lists.linux.dev
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1848265641;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 22:38:12 +0000 (UTC)
Message-ID: <8b999262c330cbe43ffa477f76ef55ed886ebce8.camel@sverdlin.org>
Subject: Re: [PATCH 3/6] cpufreq: sun50i: Add A133 speed grade detection
From: Alexander Sverdlin <alex@sverdlin.org>
To: rajanyadav0307@gmail.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>
Date: Tue, 17 Nov 2026 23:38:00 +0100
In-Reply-To: <20261104-a133-series-v1-3-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
	 <20261104-a133-series-v1-3-58217cb33a87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Rajan!

On Wed, 2026-11-04 at 22:40 -0600, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>=20
> The A133 is handled as an A100 today: only the CPU bin field at SID
> offset 0x1c is read, which gives one of three A100 voltage tables.
> The vendor BSP for this family (sun50iw10) selects one of 11 grades
> from the chip marking ID, the CPU bin, the ICPU current, the PCPU
> field, a bin extension bit and the die revision:
>=20
> - "high speed" marking IDs use the b0-b3 grades, which have 1416 and
> =C2=A0 1512 MHz instead of 1464 MHz
> - the other parts use a0-a6
> - die revisions 0, 3 and 4 ("A-E") use different grades from all other
> =C2=A0 revisions ("F and later")
> - revision A-E normal parts with ICPU and PCPU within fixed ranges use
> =C2=A0 a0
>=20
> On a KickPi K5C (A133, marking 0x1400, bin 0b010, revision 6), the BSP
> selects b2: 408-1512 MHz with 1.10 V at 1512 MHz. Mainline selects the
> A100 speed1 table instead. So the chip runs 40 mV below the vendor
> voltage at 408-816 MHz and 40 mV above it at 1200 and 1320 MHz, and its
> top OPP is 1464 MHz at 1.18 V instead of 1512 MHz at 1.10 V. Grades
> with 1416 and 1512 MHz cannot be described at all.
>=20
> Add the vendor selection for the new A133 OPP compatible. a5 and a6
> share their voltages, so the 11 grades map to speed0-9:
>=20
> =C2=A0 index:=C2=A0 0=C2=A0 1=C2=A0 2=C2=A0 3=C2=A0 4=C2=A0 5=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 6=C2=A0 7=C2=A0 8=C2=A0 9
> =C2=A0 vendor: a0 a1 a2 a3 a4 a5/a6=C2=A0 b0 b1 b2 b3
>=20
> The die revision comes from SMCCC SOC_ID, as for the H616. On the A133
> this needs TF-A with the sun50i_a133 platform, added in commit
> a584e8632a7a ("feat(allwinner): add support for allwinner A133 SoC")
> and not yet in a release; it reads the same SYSCON register as the
> BSP. Neither the A-E nor the F grades always have the lower voltage
> (for the same bin, A-E is mostly lower or equal up to 816 MHz and higher
> or equal from 1008 MHz). So without SOC_ID the driver keeps the A100
> selection, as before, adds the BSP's a0 rule for normal parts, which
> never lowers a voltage, and warns. Revision F parts then still run
> 20-40 mV below the vendor voltage at 408 and 600 MHz, some of them also
> at 816 MHz.
>=20
> The error message for a missing named cell now names the cell.
>=20
> Testing:
> - the function, built on the host from the driver source with stubbed
> =C2=A0 cells and revision, matches a transcription of the BSP rules for
> =C2=A0 120,960 combinations of boundary and typical field values, and giv=
es
> =C2=A0 the A100 selection with the BSP's a0 rule when the revision is
> =C2=A0 unknown
> - on the K5C it selects b2; the vdd-cpu regulator reads 0.94 V at
> =C2=A0 408 MHz, 0.96 V at 1008 MHz, 1.06 V at 1416 MHz and 1.10 V at
> =C2=A0 1512 MHz, as in the BSP table
> - one hour of full load held 1512 MHz without throttling (max 79 C,
> =C2=A0 with the 90 C trip from the A100 thermal trips patch)
> - with the revision forced to unknown it warns and selects speed1
> - the same kernel with the A100 OPP table gives the same OPPs as
> =C2=A0 before
> - a missing cell fails the probe with an error naming the cell, and
> =C2=A0 the system keeps running without cpufreq
>=20
> Claude Code (Anthropic) drafted this patch and its message from the
> selection rules in the vendor BSP cpufreq driver (no code copied) and
> from my test results; I reviewed and tested it.
>=20
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Tested-by: Alexander Sverdlin <alex@sverdlin.org>

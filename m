Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C792EEE88
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Jun 2026 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780612671; cv=none; b=hmylFPwaSwcm78jHvS4WItXiparXR8s9lPw9ULwrUmbhmkTdxisBsdWvg/1ZwOxXsRoxF4fwiczC9mVDSuGwiBkot1Z1KQZWRXN88/gNyRSm/z8uOb8wLHqINSxNs8uS/jWrkD5p1kM3bxwUSuPt7Mf0Xs98Fa8UXqwaZBaZjT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780612671; c=relaxed/simple;
	bh=wJxkHSt4+uNnpf6l5+6ajY9tYSWVGS4iEgWKAK5VKP4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QdfeOrTvQAn1FaYXtfAB4McikxdQg7ER4l5gdrt0tMRU4ijGJaT5r1kWWPmiqOYaCx09gmnkj5IA54/SjeNoGEwwgeb7iCRD7t1yn912miO/L83Muj8VRMRKNy7M3XSAUHpC9VwvKRhAgT1eNuukBbLiZyIZrcxg2uBbsqtC/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAjHFvub; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAjHFvub"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so6895715e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 04 Jun 2026 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780612669; x=1781217469; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pGK6nyQiO5fRhl198UMuPRvqMBmif9tHjKq3IyAKSuc=;
        b=sAjHFvubQ3lQXSpJjgRNdNMTy1cdjBES2KPu+iRbcpAASU3eK0qDoBGYaTwyS/ZDzc
         Ndr2ZGl2aZhVgeJgfW4lvG5/A0ON1cAF3JN0kVHKSWDH0v95IXShzrZCCv3QlcYnt9Jp
         q5opTMnplgWobcoh2aDxn9hBJQdEMYwYxoitHWsHYDLJptNhZLez81tOUOJyRTKIi8cA
         Evs2YNCI77aRGWUQa+4AnmTBoPwz2wmPY83qO1FDL8xjDkThhsIrk/CXxxRJNJwgrX3M
         68uloRjmmkbBzVdYml7e1b20sdFDDbAQDJek2JNYkfdnfpkSkB+Q/fDdocCCwoeLULtL
         r/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780612669; x=1781217469;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGK6nyQiO5fRhl198UMuPRvqMBmif9tHjKq3IyAKSuc=;
        b=hU/UTaS4lBU0H3O4+B7mfQjz71XMRZZkRehjQhynq1teKkHO7IajevYpZMDiLTrFVF
         sBfuKEdOJG8hidlZvRqJxXMHgSLATWAJs54EHhVZUdCVp+zE5ayhbsJITGzoqOhq6ERO
         ahnh9kdQJ8l7L3yF9RN4iZvIU5vvOlf4xau+6aizLTRiC6aspDOxwHQLx04GJnuK8wgI
         s0SOYoDn/kuvtCtBJbFwjX3gVeRAGUA8VT4YhFNqlHOECBoG+Vdlz3smMctbGVbZdKQc
         sAclqExPilZtl3r/huvttvOXV+xIcBBYjdrmdM8hQNoT3AbV3D1uadCtk8PmkeyUyeIa
         O4Pw==
X-Forwarded-Encrypted: i=1; AFNElJ/YZw38BbRk9+JwK1mvsAg0EfG5D9p76uwSqD3IGIlGilTrdh9gdw/2eD+H+pqgO1OYdlnsXnLyt01YnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDqxtmON3YDCdrVbg6BXS8kl875T0zSkkw5VqP7JXpFW0HjbCg
	RRcdkHTjeTWTu5Sh2rMoKduZVgiug+b+78LkBaGfgQhMPpRkPvT3m+wN
X-Gm-Gg: Acq92OFU6EIK+NKlbuRFstOyRNH+iUtpgrAewCE/fUdz9czizx0/bdZpm8tyhCcoBdB
	WUWTpXT9DqDO389OrW+1ZjS1zPPCRRcmlMVwf3z2LcDX+Xt8N0WdQu2LNIkfd15dOa6tMgipTIe
	BudlOZv9oIFAm+aD6y+ei24w7+gDRVBdeLmq7Fe5PI2AHV9nP8oFqECeQq3txWAPyWKvKZzhRcX
	CpdoxMmMb/iwhZjNffjn0jwBo1XXVEW8GlZoF9KQdToIWpmzFebdW1GiUr/ztXatc5Oij/by0Cf
	3tJlorQu6wSen8d88NedzFZYGdrI55x61McHjqo3J1GT7xmSYlERcjdXeKl0HJryoPJ2k57omLi
	os2y8cN+2/LGRynyA0C88XdFwIU9ilZVPyVp4gxSQ5UcOb9nYx4Lr/S5G4xSo/Dt3Trez51qu9s
	IvAEKNN0KIaSWM7MLu4Mh/tkKNxfRLQx+gd+kOuRmWGvK3/FHRYaTcSJ9LucjMU5PQY04TXl4Ck
	CRlCNiQjcKWXA==
X-Received: by 2002:a05:600c:6994:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490c25de6f1mr7829425e9.16.1780612668566;
        Thu, 04 Jun 2026 15:37:48 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c1e20b0asm13827345e9.1.2026.06.04.15.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 15:37:47 -0700 (PDT)
Message-ID: <36c392676bc5cd69de5e8ca2cabe5ccbbced7517.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 05 Jun 2026 00:37:40 +0200
In-Reply-To: <20260518235432.07537260@ryzen.lan>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
		<20260510201644.4143710-4-alexander.sverdlin@gmail.com>
		<agr9m_tidBr6Cu2h@collins>
		<04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
	 <20260518235432.07537260@ryzen.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Andre,

On Mon, 2026-05-18 at 23:54 +0200, Andre Przywara wrote:
> > > > +&reg_dcdc2 {
> > > > +	regulator-always-on;
> > > > +	regulator-min-microvolt =3D <500000>;
> > > > +	regulator-max-microvolt =3D <1300000>;=C2=A0=20
> > >=20
> > > Should be:
> > > =C2=A0	regulator-min-microvolt =3D <900000>;
> > > =C2=A0	regulator-max-microvolt =3D <1300000>;=C2=A0=20
> >=20
> > 0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?
>=20
> Do you have the CPU OPPs for this board? Do they slightly
> overclock/over-volt the core? We have seen this for some other boards.
> But you could go with the safer 810mV...1200mV range, and we adjust
> this when needed.

I'm not sure how to interpret this, if it helps, vendor BSP has:

root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/
clock-latency-ns  name              opp-hz            opp-microvolt-b0  opp=
-microvolt-b1  opp-microvolt-b2  opp-microvolt-b3 =20
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b0
00000000  00 12 01 60                                       |...`|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b1
00000000  00 11 3e 10 00 11 3e 10  00 11 65 20              |..>...>...e |
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b2
00000000  00 10 c8 e0                                       |....|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/opp@1512000000=
/opp-microvolt-b3
00000000  00 10 7a c0                                       |..z.|
root@HelperA133:~# hexdump -Cv /proc/device-tree/opp_l_table/compatible=20
00000000  61 6c 6c 77 69 6e 6e 65  72 2c 73 75 6e 35 30 69  |allwinner,sun5=
0i|
00000010  2d 6f 70 65 72 61 74 69  6e 67 2d 70 6f 69 6e 74  |-operating-poi=
nt|
00000020  73 00                                             |s.|

At least 1512MHz is possible (but datasheet says 1.6GHz, so probably no ove=
rclocking yet).

--=20
Alexander Sverdlin.

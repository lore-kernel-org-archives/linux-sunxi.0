Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370741BF37
	for <linux-sunxi@lists.linux.dev>; Thu,  1 May 2025 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114372; cv=none; b=a9jtIb4Y/chS/+odMc9JaBCko8oVMHd6VOa3wTqrPFEkhdRaXAzhbzOsWoUR5y6rIYRlj3HT/tMUwC7kGXYMnURnRTNe0satrpJ+vCnKjFvY9YgSePH1ptP19Zq+NBxw1pN9/XmQ/dXHRMbikTnHQoCj1AZHajXOjWV51gkO4TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114372; c=relaxed/simple;
	bh=kOV/RvVAKadidu9KAU/VFVRdmBSfmIKZwLsXnFqoOjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hb6UcahmcR+LIWfaoLK7ovw6xf3M6Hxv0AMWt9rMMwr+wB945fajL4xpaCBSTjo86wc0Lpqe6tAir/xyCFyAGVg2gGLknnLnrD0569083xxRMrbkrXw6HDoehJX/ad+CVEO5E63MLM/RKyyVcvhWVkP/5qWDFBq3m5h73/AZYWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e98f73850so1098407e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 May 2025 08:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746114367; x=1746719167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tf8WhDVkUdxDI7igFuxuiQMXFm304tFlxLE0rZDx1g8=;
        b=rkcPdl82wcjlcPrhXN9ZMwRoY5sFWt/11dX4/jqIGIAcjiG9khh6oSMPayCGI507ru
         UItt2XgCGmiE+jEVX5/n9Z/GHNf1VCgAgQSO8R0Xyu7+mXPodCc9BbxqxP4zUbufGj3V
         8hEVTCQLLsBkSADm8AtUC/bU2umbLscfUqN7MSrr4gG2V7h2vXqwctNNNTXY4K1QOPvM
         /Aj7BQLZPDeLNlI+d7iAoAg4+3qa5xmCgJKMDXod2RHPQtwiBx2WyGKuMkpBet4mySdK
         OjvuuFzuid/yAPdHF86t4z+3g0/gUQfJ17sPm8DCR6rCDfsmXy399U6M2g0tW5ImcX2N
         j5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWoj4b6NsBcT/bKkdOLPVJgffvKQU3W/brOyaCXLEGTf+pCPMQozGdpXY5Bi7ZiBgmW+INMLIpGp9CPHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrTRVdTw8g2ryWmhd7aK7sN1J2BoDMR95qL2iPjt2TS1FvYEGt
	ocQCy+hefNmgO0mVFlzgXRPZP9cfIfFhPFJYGk1x4NQxPZ6/Sv48JbRniWE5
X-Gm-Gg: ASbGncusaIic/FE3RdVETngzYLNhAdU9hvUY6+jxcTqrUbeInv81icse7pL3QPaZ5pj
	jJINEr3msAs8dGEorhutsnMuqRJalB5+IYesX/52wY0bgeWriO47SXYt5+MkTXKWdW/11a7lAE0
	miFLAycqwXuWGjf4M9g1Uhdhe7mr3Rwphq63dcHYAhU61R4OJyilWnIzOBex/RArwgcEQKNXGH4
	nqJiM4QUN9uYxC7dU1sh6BhITLNipUTBU4qAsPXIb5rI0gKZ4tEVt0Uyos5Jb3G4dlohWFEOwcr
	xEObZX/S2qF0eYduS4fImmwFZMBnNKWK3nBQwILtfsVyJM+LxfaRvkHDDeu27tXhzJDxThsDZCn
	hY5bDVfof
X-Google-Smtp-Source: AGHT+IEx8cXkp233jATcJPD35W6igAeGyuwWDhiFrrJdEmcuiit/p2b6UAeE4i1hp0kcnP4wOfqwpA==
X-Received: by 2002:a05:6512:1313:b0:54b:ed9:2cf9 with SMTP id 2adb3069b0e04-54ea763a927mr1044986e87.4.1746114366774;
        Thu, 01 May 2025 08:46:06 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94eeacbsm130246e87.145.2025.05.01.08.46.06
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:46:06 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so8130941fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 01 May 2025 08:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVujIY3aTWnrBKGVfGRShpI1LyUq0oc/PEXDwLbermWJQnstPDIF1uYEq5M7Fn9m8MI3UXt5114zAk9Gw==@lists.linux.dev
X-Received: by 2002:a2e:a10a:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-31fc37e56ebmr10772091fa.30.1746114366262; Thu, 01 May 2025
 08:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430095325.477311-1-andre.przywara@arm.com>
 <174610166405.2974716.1586244113913047340.b4-ty@csie.org> <20250501132211.0310ae49@donnerap.manchester.arm.com>
 <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com> <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur>
In-Reply-To: <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 May 2025 23:45:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
X-Gm-Features: ATxdqUGcnEKGJjm2HU-9yaU_F74x1jRZn8TUPU72yUe__mPMXUKI345fxuutDz0
Message-ID: <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
Subject: Re: b4 thank-you letter shows incorrect repo URL
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 10:26=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, May 01, 2025 at 10:06:22PM +0800, Chen-Yu Tsai wrote:
> > (dropped most people and lists from CC; added Konstantin and kernel.org=
 users)
>
> Note, it should go to tools@kernel.org, not users@kernel.org.

Ack. Dropping users@kernel.org.

> > > > Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux-s=
unxi.git, thanks!
> > >
> > > thanks for that, but the URL here is not correct, is it? Should be th=
e
> > > kernel.org repo instead? Saw this already in other "applied" emails.
> >
> > That's weird. It is correctly pushed to the kernel.org repo [1].
> > Maybe it's because the git-config remote entry for korg repo's  is call=
ed
> > "sunxi-korg", and the linux-sunxi one on GitHub is called "sunxi", and
> > somehow b4 is getting confused?
> >
> > Konstantin, have you heard of such reports? FYI my b4 is version 0.14.2=
.
>
> This is coming from your custom template, not from b4 itself. By default,=
 b4
> just says "Applied to ${branch}".

My template is: "Applied to ${branch} in ${treename}, thanks!"

My .git/config is as follows:

[remote "sunxi"]
        url =3D git@github.com:linux-sunxi/linux-sunxi.git
        tagopt =3D --no-tags
        fetch =3D +refs/heads/*:refs/remotes/sunxi-github/*
[remote "sunxi-korg"]
        url =3D https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux=
.git
        pushURL =3D git@gitolite.kernel.org:pub/scm/linux/kernel/git/sunxi/=
linux
        fetch =3D +refs/heads/*:refs/remotes/sunxi-korg/*
        tagopt =3D --no-tags
        b4-commit-url-mask =3D https://git.kernel.org/sunxi/linux/c/%.12s

Also, the branch I applied it to is named "sunxi/clk-fixes-for-6.15",
both locally and in the kernel.org repo, not "clk-fixes-for-6.15" as
shown in the original thank-you email.

I think there is a parsing error somewhere. Maybe b4 isn't dealing with
nested branch names correctly and somehow thinks the "sunxi/" part is
actually the remote name.

If I rename the "sunxi" remote to "sunxi-github", `b4 ty` now generates:

    Applied to sunxi/clk-fixes-for-6.15 in local tree, thanks!

Again this seems to point to accidentally treating part of the branch name
as the remote name.


ChenYu

Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB68A202976
	for <linux-sunxi@lists.linux.dev>; Thu,  1 May 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114597; cv=none; b=aYQA9rTH0tHzQPciIIkCaN+mrGl+B/UIJvYg1o8UvolK4TjVNKHqKb8UtML9BLLLwJmqzEBxcQI5uHiaqLW0Cj6drcftujp0T87LMZ0j32q0tZuY/plM1qyYu5p5pRDFW/JZ6yjW+VB7DN1+3+nworRTWp6Z5m0NkDY3KW5BpIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114597; c=relaxed/simple;
	bh=W9BachoRTeAygYcbHIbG7xkpsgUWVuBAAJuX3hIFZPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frK4P5sUeiDBWgOcCjR5NieyJtkVtiD8wJAwRLTAuO6PuqYab6j+rbnNONNMcWOoqVpIiv4f+6C3KTsFpLjf+TVhQL7j17bXpl0J00IkTAPJQRZ/efXwW+cpuhzDbzreWUPYJF8AP2m4vB7Wet5zLvhucNQhlu0iZiAjyLKqXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1382235e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 01 May 2025 08:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746114593; x=1746719393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P/BY26p+uht5cjoH02VGkGf/8sVgcKuidq7b9URqiKc=;
        b=UgCWvTPSTTkkiJanrhsg6z02H27nQ9xD52lE9mHQRyMH7cFSOdNz1ggZxo0pvRax3y
         ahiineAQtxkMwbwfXEII7TVkQuM57g3eYLPLO1lNL60r8fmvTKrtdI1AyrEPjOdmJBNS
         kDM3iVeDLfill79+GtSGeF+RRqmLrJwPDWWtD2v0W4ksVueqx4Zs/6JIOtrkQ9AjycAc
         8DK5UijGOZo5UARQG63s/5WG5CsEx+ZinVHfniCUO2ZxdzhFPMxhylVRvoRfmJJnPPsV
         Z9Xkn6cyWtuSZo6vssXJnQlx6ZYcDTadKyo38xUJKhnSkyhUX3IEbLcEOwSyPinF/X8n
         Frlw==
X-Forwarded-Encrypted: i=1; AJvYcCUMLQS6PJZo8B49xwA+6hgXTZXJWgdVbM0KrN7tJ842Hgp4EhsyLtRWpQA7dLkzpGD0qsHog+ASV6VU/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQZhrkTIonDhEM4/dDQo3t1C0cKT5C9L7+k0NSF7udZB7MMwIM
	FbzUt/SM/RlCTjeNXMb1Kq89okeuAQS4KsddB09C4R9eKiEeDGQxpdHT4Rp9
X-Gm-Gg: ASbGnctE0RASk9tcplG/B7LHpmzvjbT8DHRCggLlGeQ6vKHkb6bhuL9sAINpXYRs8yo
	KojL7TXAbqQ9ZfWJPJ/rDykcQhZMlG+9n+mJmYpCWYcbXUt9TQxqM/g5GldrvdvGZd3RPRStid+
	442Vmv8f9HmukQWbHhaZy3wg7niyFnlNI4GIixG1QmJsZfKeqnnlE78sKWSXGWFaFPm+YbD7+Ct
	OTAZ7saqOOQgVuPq6nh5ogEt/HH7lTi8Zccu4dW2xnBIwYjwAMSJEPogcYbggYlphZ2lQIjtp/2
	9Aa8Hce1wmQjQXsdTxl5rBBqaxaDVqHj+TkfTnDG2+aSWIgTCtlT3AJSZGzsNqsakoWorN4A+w=
	=
X-Google-Smtp-Source: AGHT+IFd0avw6bqpSxggdzIn66LemqUeJsMPZe+CKXEo/BSgSQukzh6gI8iSdINZJCSoo+t0U59O1Q==
X-Received: by 2002:a05:6512:3d9f:b0:549:39b1:65c2 with SMTP id 2adb3069b0e04-54ea766b50cmr815239e87.48.1746114592445;
        Thu, 01 May 2025 08:49:52 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f18e7sm127849e87.198.2025.05.01.08.49.52
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:49:52 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c461a45f8so8674621fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 May 2025 08:49:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG/TlYWYPRtMBBjP4DAJZXulX1L4mbUvCjFuix75V4Nj3k0x0CLsAJ7BPTeVVQD2zyPpyD4wd7hluBvQ==@lists.linux.dev
X-Received: by 2002:a2e:a815:0:b0:30a:4484:3ee1 with SMTP id
 38308e7fff4ca-31fc285a2f9mr9843211fa.23.1746114592022; Thu, 01 May 2025
 08:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430095325.477311-1-andre.przywara@arm.com>
 <174610166405.2974716.1586244113913047340.b4-ty@csie.org> <20250501132211.0310ae49@donnerap.manchester.arm.com>
 <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com>
 <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur> <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
In-Reply-To: <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 May 2025 23:49:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v66RkWixx4NB+a5L9_V=bs3wOSWqaSv9QeWb9-aYy2YxaQ@mail.gmail.com>
X-Gm-Features: ATxdqUEzaINQ96UDrlB5H71xYG8BIF1gchMgabIx0ovgFq-rMIETBvUGQy2ssOo
Message-ID: <CAGb2v66RkWixx4NB+a5L9_V=bs3wOSWqaSv9QeWb9-aYy2YxaQ@mail.gmail.com>
Subject: Re: b4 thank-you letter shows incorrect repo URL
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 11:45=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, May 1, 2025 at 10:26=E2=80=AFPM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > On Thu, May 01, 2025 at 10:06:22PM +0800, Chen-Yu Tsai wrote:
> > > (dropped most people and lists from CC; added Konstantin and kernel.o=
rg users)
> >
> > Note, it should go to tools@kernel.org, not users@kernel.org.
>
> Ack. Dropping users@kernel.org.
>
> > > > > Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux=
-sunxi.git, thanks!
> > > >
> > > > thanks for that, but the URL here is not correct, is it? Should be =
the
> > > > kernel.org repo instead? Saw this already in other "applied" emails=
.
> > >
> > > That's weird. It is correctly pushed to the kernel.org repo [1].
> > > Maybe it's because the git-config remote entry for korg repo's  is ca=
lled
> > > "sunxi-korg", and the linux-sunxi one on GitHub is called "sunxi", an=
d
> > > somehow b4 is getting confused?
> > >
> > > Konstantin, have you heard of such reports? FYI my b4 is version 0.14=
.2.
> >
> > This is coming from your custom template, not from b4 itself. By defaul=
t, b4
> > just says "Applied to ${branch}".
>
> My template is: "Applied to ${branch} in ${treename}, thanks!"
>
> My .git/config is as follows:
>
> [remote "sunxi"]
>         url =3D git@github.com:linux-sunxi/linux-sunxi.git
>         tagopt =3D --no-tags
>         fetch =3D +refs/heads/*:refs/remotes/sunxi-github/*
> [remote "sunxi-korg"]
>         url =3D https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/lin=
ux.git
>         pushURL =3D git@gitolite.kernel.org:pub/scm/linux/kernel/git/sunx=
i/linux
>         fetch =3D +refs/heads/*:refs/remotes/sunxi-korg/*
>         tagopt =3D --no-tags
>         b4-commit-url-mask =3D https://git.kernel.org/sunxi/linux/c/%.12s
>
> Also, the branch I applied it to is named "sunxi/clk-fixes-for-6.15",
> both locally and in the kernel.org repo, not "clk-fixes-for-6.15" as
> shown in the original thank-you email.
>
> I think there is a parsing error somewhere. Maybe b4 isn't dealing with
> nested branch names correctly and somehow thinks the "sunxi/" part is
> actually the remote name.
>
> If I rename the "sunxi" remote to "sunxi-github", `b4 ty` now generates:
>
>     Applied to sunxi/clk-fixes-for-6.15 in local tree, thanks!
>
> Again this seems to point to accidentally treating part of the branch nam=
e
> as the remote name.

Also, I found a thank-you letter that is correct that is from Jan. 2025:

    https://lore.kernel.org/linux-sunxi/173617837421.3282465.58930600702338=
3641.b4-ty@csie.org/

The next one that I found was incorrect. This one is from Feb. 2025:

    https://lore.kernel.org/linux-sunxi/173909140135.1184685.57849106777273=
56231.b4-ty@csie.org/

Though it could be I upgraded something on my workstation some time
in between.


ChenYu

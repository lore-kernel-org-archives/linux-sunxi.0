Received: from m3-bln.bund.de (m3-bln.bund.de [77.87.224.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE8286A3
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 12:16:53 +0000 (UTC)
Received: from m3-bln.bund.de (localhost [127.0.0.1])
	by m3-bln.bund.de (Postfix) with ESMTP id 9E81E208432
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 14:09:27 +0200 (CEST)
Received: (from localhost) by m3-bln.bund.de (MSCAN) id 6/m3-bln.bund.de/smtp-gw/mscan;
     Wed Sep 27 14:09:27 2023
X-NdB-Source: NdB
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; d=itzbund.de;
	s=230316-2017-ed25519; t=1695816563;
	bh=NuCL+Ul/0dtzEbUBik1/xqBHCY4XgXXsKJePOuodXgc=;
	h=Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Autocrypt:Cc:Content-Transfer-Encoding:
	 Content-Type:Date:From:In-Reply-To:Mime-Version:Openpgp:References:
	 Reply-To:Resent-To:Sender:Subject:To;
	b=OpjVqZYHcoJZ7m/wT+4d/5NiQKv0fulKLsT+Qa7cn81ZINAa6ZOgrV6KspxmOnyfq
	 sclQidRYJHzs/Fag8ySAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=itzbund.de;
	s=230316-2017-rsa; t=1695816563;
	bh=NuCL+Ul/0dtzEbUBik1/xqBHCY4XgXXsKJePOuodXgc=;
	h=Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Autocrypt:Cc:Content-Transfer-Encoding:
	 Content-Type:Date:From:In-Reply-To:Mime-Version:Openpgp:References:
	 Reply-To:Resent-To:Sender:Subject:To;
	b=px8cJpW/xEwzKaMsIhDTNJAywlIRVwTW3rmmnS8NWW0nJwHDjnB3USGzwO8HSunXe
	 dj0zws/2qPDGPp56efLuvhfLPdOn3/3fIMefAF5MxGdkbVqogk+jhP7hZMWA5G6DYJ
	 mmAFVZ9e02BvNUJhUT9JHiZFKduE/AUrzlcvWdHGeRWGDB6g63JPQvQSoBRszSbLxX
	 FHfwqjBk0E715754iflzsQryTLzbD8XBp0EHb8mTgLtDyrofxtnc+W2KkQo93iH6V7
	 rostVYopeu9Dy7lQdLKTZ9aSXPIRMboRp9myNNGdavxhXEIOqV9dOpOpzxvsLUC5VP
	 pUxatEJR7PaxQ==
X-P350-Id: 28a0db990aee8ed8
Date: Wed, 27 Sep 2023 14:09:22 +0200
From: E-Mail-Administration ITZBund <noreply@itzbund.de>
To: linux-sunxi@lists.linux.dev
Subject: Ihre E-Mail konnte nicht zugestellt werden
Message-ID: <20230927120922.GA4070@vlp22140.prod.groupware.itz.itzbund.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Rusd: domwl, Pass through domain itzbund.de

Sehr geehrte Damen und Herren,

bitte antworten Sie nicht auf diese Benachrichtigung. Kontaktm=F6glichkeite=
n entnehmen Sie bitte der E-Mail-Signatur.

Aufgrund eines Zertifikatsproblems auf einem Antivirus-Gateway des ITZBund =
konnten E-Mails nicht zugestellt werden. Diese Nachrichten sollten daher no=
ch einmal versendet werden.

Sie erhalten diese Benachrichtigung, da Ihre E-Mail-Adresse in einer der fr=
aglichen Nachrichten enthalten war. Nachfolgend finden Sie die Einzelheiten=
 zu dieser E-Mail:

Datumsstempel: 25.09.2023 11:48

Absender: joro@8bytes.org
Empf=E4nger: samuel@sholland.org, mpe@ellerman.id.au, christophe.leroy@csgr=
oup.eu, orsonzhai@gmail.com, jsnitsel@redhat.com, angelogioacchino.delregno=
@collabora.com, linux-sunxi@lists.linux.dev, matthias.bgg@gmail.com, digetx=
@gmail.com, yong.wu@mediatek.com, jonathanh@nvidia.com, linux-arm-kernel@li=
sts.infradead.org, mjrosato@linux.ibm.com, jernej.skrabec@gmail.com, baolu.=
lu@linux.intel.com, krzysztof.kozlowski@linaro.org, jgg@nvidia.com, thierry=
=2Ereding@gmail.com, alim.akhtar@samsung.com, will@kernel.org, m.szyprowski=
@samsung.com, nicolinc@nvidia.com, linux-mediatek@lists.infradead.org, ande=
rsson@kernel.org, agross@kernel.org, linux-tegra@vger.kernel.org, linuxppc-=
dev@lists.ozlabs.org, extern.martin.grimm@itzbund.de, treding@nvidia.com, k=
onrad.dybcio@linaro.org, baolin.wang@linux.alibaba.com, npiggin@gmail.com, =
kevin.tian@intel.com, linux-s390@vger.kernel.org, linux-samsung-soc@vger.ke=
rnel.org, linux@armlinux.org.uk, zhang.lyra@gmail.com, steven.price@arm.com=
, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, linux-rockchip@lis=
ts.infradead.org, iommu@lists.linux.dev, vdumpa@nvidia.com, heiko@sntech.de=
, linux-arm-msm@vger.kernel.org, robin.murphy@arm.com, wens@csie.org, robdc=
lark@gmail.com

Betreff: 'Re: [PATCH v8 00/24] iommu: Make default_domain's mandatory'

Sollten Sie der Absender sein, so erw=E4gen Sie bitte den erneuten Versand.=
 In dem Fall, da=DF Sie diese E-Mail h=E4tten erhalten sollen, informieren =
Sie bitte den Absender =FCber Ihren Wunsch, die E-Mail erneut zu versenden.

Wir m=F6chten uns f=FCr die Unannehmlichkeiten entschuldigen.

F=FCr R=FCckfragen steht Ihnen die E-Mail-Administration des ITZBund gerne =
zur Verf=FCgung.


Freundliche Gr=FC=DFe

Ihre E-Mail-Administration
_______________________________________
V A 51 40 - Gateway-Systeme und Schnittstellen
Informationstechnikzentrum Bund (ITZBund)

Postanschrift: Postfach 301645, 53196 Bonn
E-Mail: VA5140@itzbund.de

